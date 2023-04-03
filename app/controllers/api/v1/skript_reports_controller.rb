# This controller handles requests related to script reports.
# It inherits from Api::V1::ErrorReportsController.
class Api::V1::SkriptReportsController < Api::V1::ErrorReportsController
  # Use a before_action to authenticate the user before they can access any actions.
  before_action :authenticate_mitify_user!

  # GET /skript_reports
  # 
  # Retrieves all script reports based on Api::V1::ErrorReportsController#get_reports method
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
  def index
    @skript_reports = get_reports().where(type: "SkriptReport")

    render json: 
      @skript_reports.as_json(include: { mitify_user: {
                                                        only: [:name, :first_name, :email],
                                                        include:{ role: {
                                                        only: :title}}}})
  end

  # POST /skript_reports
  #
  # Creates a new script report based on Api::V1::ErrorReportsController#save_report method.
  # The attributes are obtained from the `report_params` method.
  def create
    @skript_report = SkriptReport.new(report_params)

    save_report(@skript_report)
  end
  

  private
    # Filters the parameters for creating a new script report record.
    def report_params
      params.require(:skript_report).permit(:reportType, :description, :status, :priority, :author,
                                            :eMail, :page, :chapter, :illustrationNumber, :tableNumber,
                                            :report_date, :granted_date, :completed_date,
                                            :university_module_id)
    end
end