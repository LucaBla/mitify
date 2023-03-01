class Api::V1::VideoReportsController < ApplicationController
  before_action :set_video_report, only: %i[ show update destroy ]
  before_action :authenticate_mitify_user!

  # GET /video_reports
  def index
    @video_reports = VideoReport.all

    render json: @video_reports
  end

  # GET /video_reports/1
  def show
    render json: {
      video_report: @video_report,
      author: @video_report.mitify_user
    }
  end

  # POST /video_reports
  def create
    @video_report = VideoReport.new(video_report_params)

    if @video_report.save
      render json: @video_report, status: :created
    else
      render json: @video_report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /video_reports/1
  def update
    if @video_report.update(video_report_params)
      render json: @video_report
    else
      render json: @video_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /video_reports/1
  def destroy
    @video_report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video_report
      @video_report = VideoReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_report_params
      params.require(:video_report).permit( :reportType, :module, :description, :status, :priority, :author,
                                            :eMail, :videoTitle, :timestampStart, :timestampEnd, :videoURL,
                                            :report_date, :granted_date, :completed_date)
    end
end