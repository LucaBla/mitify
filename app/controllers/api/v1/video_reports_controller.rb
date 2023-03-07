class Api::V1::VideoReportsController < Api::V1::ErrorReportsController
  before_action :authenticate_mitify_user!

  # GET /video_reports
  def index
    @skript_reports = get_reports().where(type: "VideoReport")

    render json: 
      @video_reports.as_json(include: { mitify_user: {
                                                        only: [:name, :first_name, :email],
                                                        include:{ role: {
                                                          only: :title}}}})
  end

  # POST /video_reports
  def create
    @error_report = VideoReport.new(report_params)
    save_report(@error_report)
  #end
  end

  private
    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:video_report).permit( :reportType, :description, :status, :priority, :author,
                                            :eMail, :videoTitle, :timestampStart, :timestampEnd, :videoURL,
                                            :report_date, :granted_date, :completed_date,
                                            :university_module_id)
    end
end