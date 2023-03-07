class Api::V1::ErrorReportsController < ApplicationController
  before_action :set_error_report, only: %i[ show update destroy ]
  before_action :authenticate_mitify_user!

  # GET /error_reports
  def index
     get_reports()
    
     render json: 
     @error_reports.as_json(include: { mitify_user: {
                                                         only: [:name, :first_name, :email],
                                                         include:{ role: {
                                                         only: :title}}}})
  end

  # GET /error_reports/1
  def show
    render json: {
      error_report: @error_report,
      author: @error_report.mitify_user
    }
  end

  # POST /error_reports
  def create
    @error_report = ErrorReport.new(report_params)

    save_report(@error_report)
  end

  # PATCH/PUT /error_reports/1
  def update
    if @error_report.update(report_params)
      render json: @error_report
    else
      render json: @error_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /error_reports/1
  def destroy
    @error_report.destroy
  end

  private

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
  
       if index_params[:status] == "closed"
        @error_reports = @error_reports.where(status: "closed")
                                           .order(:priority)
       else
        @error_reports = @error_reports.where.not(status: "closed")
                                          .order(:priority)
       end
       @error_reports
    end

    def save_report(report)
      report.mitify_user = current_mitify_user

      if report.save
        render json: report, status: :created
      else
        render json: report.errors, status: :unprocessable_entity
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_error_report
      @error_report = ErrorReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def index_params
      params.permit(:status)
    end

    def report_params
      params.require(:error_report).permit(:description)
    end
end
