class Api::V1::SkriptReportsController < Api::V1::ErrorReportsController
  before_action :authenticate_mitify_user!

  # GET /skript_reports
  def index
    @skript_reports = get_reports().where(type: "SkriptReport")

    render json: 
      @skript_reports.as_json(include: { mitify_user: {
                                                        only: [:name, :first_name, :email],
                                                        include:{ role: {
                                                        only: :title}}}})
  end

  # POST /skript_reports
  def create
    @skript_report = SkriptReport.new(report_params)

    save_report(@skript_report)
  end
  

  private
    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:skript_report).permit(:reportType, :description, :status, :priority, :author,
                                            :eMail, :page, :chapter, :illustrationNumber, :tableNumber,
                                            :report_date, :granted_date, :completed_date,
                                            :university_module_id)
    end
end