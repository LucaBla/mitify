require "test_helper"

class ErrorReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @error_report = error_reports(:one)
  end

  test "should get index" do
    get error_reports_url, as: :json
    assert_response :success
  end

  test "should create error_report" do
    assert_difference("ErrorReport.count") do
      post error_reports_url, params: { error_report: { description: @error_report.description, module: @error_report.module } }, as: :json
    end

    assert_response :created
  end

  test "should show error_report" do
    get error_report_url(@error_report), as: :json
    assert_response :success
  end

  test "should update error_report" do
    patch error_report_url(@error_report), params: { error_report: { description: @error_report.description, module: @error_report.module } }, as: :json
    assert_response :success
  end

  test "should destroy error_report" do
    assert_difference("ErrorReport.count", -1) do
      delete error_report_url(@error_report), as: :json
    end

    assert_response :no_content
  end
end
