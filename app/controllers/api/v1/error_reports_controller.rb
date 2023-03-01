class Api::V1::ErrorReportsController < ApplicationController
  before_action :set_error_report, only: %i[ show update destroy ]
  before_action :authenticate_mitify_user!

  # GET /error_reports
  def index
    #@error_reports = ErrorReport.all
    @error_reports = ErrorReport.includes(mitify_user: [:role])

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
    @error_report = ErrorReport.new(error_report_params)

    if @error_report.save
      render json: @error_report, status: :created
    else
      render json: @error_report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /error_reports/1
  def update
    if @error_report.update(error_report_params)
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
    # Use callbacks to share common setup or constraints between actions.
    def set_error_report
      @error_report = ErrorReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def error_report_params
      params.require(:error_report).permit(:module, :description)
    end
end
