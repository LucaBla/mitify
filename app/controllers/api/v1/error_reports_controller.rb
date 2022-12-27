class Api::V1::ErrorReportsController < ApplicationController
  before_action :set_error_report, only: %i[ show update destroy ]

  # GET /error_reports
  def index
    @error_reports = ErrorReport.all

    render json: @error_reports
  end

  # GET /error_reports/1
  def show
    render json: @error_report
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
