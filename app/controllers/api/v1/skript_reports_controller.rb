class Api::V1::SkriptReportsController < ApplicationController
  before_action :set_skript_report, only: %i[ show update destroy ]

  # GET /skript_reports
  def index
    @skript_reports = SkriptReport.all

    render json: @skript_reports
  end

  # GET /skript_reports/1
  def show
    render json: @skript_report
  end

  # POST /skript_reports
  def create
    @skript_report = SkriptReport.new(skript_report_params)

    if @skript_report.save
      render json: @skript_report, status: :created
    else
      render json: @skript_report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /skript_reports/1
  def update
    if @skript_report.update(skript_report_params)
      render json: @skript_report
    else
      render json: @skript_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /skript_reports/1
  def destroy
    @skript_report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skript_report
      @skript_report = SkriptReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def skript_report_params
      params.require(:skript_report).permit(:reportType, :module, :description, :status, :priority, :author,
                                            :eMail, :page, :chapter, :illustrationNumber, :tableNumber,
                                            :report_date, :granted_date, :completed_date)
    end
end