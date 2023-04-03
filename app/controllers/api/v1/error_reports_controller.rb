# This controller handles API requests related to error reports.
class Api::V1::ErrorReportsController < ApplicationController
   # Use a before_action to set the error report for actions that require it.
  before_action :set_error_report, only: %i[ show update destroy ]

  # Use a before_action to authenticate the user before they can access any actions.
  before_action :authenticate_mitify_user!

  # GET /error_reports
  #
  # Retrieves all script reports based on the get_reports method.
  # and returns them as a JSON response.
  # Each with the following fields:
  # - `id`: integer.
  # - `reportType`: string.
  # - `description`: string.
  # - `status`: string.
  # - `priority`: integer.
  # - `author`: string.
  # - `eMail`: string.
  # - `page`: integer.
  # - `chapter`: integer.
  # - `illustrationNumber`: integer.
  # - `tableNumber`: integer.
  # - `videoTitle`: string.
  # - `timestampStart`: string.
  # - `timestampEnd`: string.
  # - `videoURL`: string.
  # - `report_date`: string in the format YYYY-MM-DD.
  # - `granted_date`: string in the format YYYY-MM-DD.
  # - `completed_date`: string in the format YYYY-MM-DD.
  # - `university_module_id`: integer.
  # - `mitify_user`: hash.
  #   - `name`: string.
  #   - `first_name`: string.
  #   - `email`: string.
  #   - `role`: hash.
  #     - `title`: string.
  # Each error report includes the name, first name, email address, and role of the user who created it.
  def index
     get_reports()
    
     render json: 
     @error_reports.as_json(include: { mitify_user: {
                                                         only: [:name, :first_name, :email],
                                                         include:{ role: {
                                                         only: :title}}}})
  end

  # GET /error_reports/1
  #
  # Returns the details of a specific error report, including the author.
  def show
    render json: {
      error_report: @error_report,
      author: @error_report.mitify_user
    }
  end

  # POST /error_reports
  #
  # Creates a new error report based on the save_report method.
  # The attributes are obtained from the `report_params` method.
  def create
    @error_report = ErrorReport.new(report_params)

    save_report(@error_report)
  end

  # PATCH/PUT /error_reports/1
  #
  # Updates the specified error report.
  # The attributes are obtained from the `report_params` method.
  # returns the updated error report on success.
  def update
    if @error_report.update(report_params)
      render json: @error_report
    else
      render json: @error_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /error_reports/1
  #
  # Deletes the specified error report.
  def destroy
    @error_report.destroy
  end

  private

    # Retrieves a list of error reports based on the current MitifyUser 's role and the `status` parameter.
    #
    # **Role:**
    # Returns error reports that belong to the current MitifyUser if they are a student,
    # Returns all error reports of university modules they are responsible for if they are a module leader.
    # Returns an error message if the MitifyUser does not have a fitting role.
    #
    # **Status:**
    # Returns only completed error reports if status is"abgeschlossen".
    # Returns all error reports that are not completed if status is not "abgeschlossen".
    def get_reports
      if current_mitify_user.role.title == "Student"
        @error_reports = ErrorReport.includes(mitify_user: [:role])
                                       .where(mitify_user: current_mitify_user)
      elsif current_mitify_user.role.title == "Modulverantwortlicher"
        @error_reports = ErrorReport.includes(mitify_user: [:role]).joins(:university_module)
                                    .where(university_module: {responsible: current_mitify_user})
      else
        render json:{
          message: "no fitting role!"
        }
         return
      end
  
      if index_params[:status] == "abgeschlossen"
        @error_reports = @error_reports.where(status: "abgeschlossen")
                                           .order(:priority)
      else
        @error_reports = @error_reports.where.not(status: "abgeschlossen")
                                          .order(:priority)
      end
        @error_reports
    end

    # Sets the current MitifyUser as the author of the report and saves the report to the database. 
    # If the report is successfully saved,
    # the response will include the JSON representation of the report and a status of :created.
    # If there are any validation errors,
    # the response will include the error messages and a status of :unprocessable_entity.
    #
    # @param report [ErrorReport] The error report to be saved
    # @return [void]
    def save_report(report)
      report.mitify_user = current_mitify_user

      if report.save
        render json: report, status: :created
      else
        render json: report.errors, status: :unprocessable_entity
      end
    end

    # Sets the instance variable @error_report to the error report specified by the :id parameter
    # in the request.
    def set_error_report
      @error_report = ErrorReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def index_params
      params.permit(:status)
    end

    # Filters the parameters for creating a new error report.
    def report_params
      params.require(:error_report).permit(:description)
    end
end
