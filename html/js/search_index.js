var search_data = {"index":{"searchIndex":["api","v1","errorreportscontroller","sessionscontroller","skriptreportscontroller","videoreportscontroller","applicationcontroller","errorreport","jwtdenylist","mitifyuser","role","skriptreport","universitymodule","videoreport","create()","create()","create()","destroy()","get_reports()","index()","index()","index()","index_params()","log_out_failure()","log_out_success()","report_params()","report_params()","report_params()","resond_to_on_destroy()","respond_with()","save_report()","set_error_report()","show()","update()","readme"],"longSearchIndex":["api","api::v1","api::v1::errorreportscontroller","api::v1::sessionscontroller","api::v1::skriptreportscontroller","api::v1::videoreportscontroller","applicationcontroller","errorreport","jwtdenylist","mitifyuser","role","skriptreport","universitymodule","videoreport","api::v1::errorreportscontroller#create()","api::v1::skriptreportscontroller#create()","api::v1::videoreportscontroller#create()","api::v1::errorreportscontroller#destroy()","api::v1::errorreportscontroller#get_reports()","api::v1::errorreportscontroller#index()","api::v1::skriptreportscontroller#index()","api::v1::videoreportscontroller#index()","api::v1::errorreportscontroller#index_params()","api::v1::sessionscontroller#log_out_failure()","api::v1::sessionscontroller#log_out_success()","api::v1::errorreportscontroller#report_params()","api::v1::skriptreportscontroller#report_params()","api::v1::videoreportscontroller#report_params()","api::v1::sessionscontroller#resond_to_on_destroy()","api::v1::sessionscontroller#respond_with()","api::v1::errorreportscontroller#save_report()","api::v1::errorreportscontroller#set_error_report()","api::v1::errorreportscontroller#show()","api::v1::errorreportscontroller#update()",""],"info":[["Api","","Api.html","","<p>Module for API-related functionality.\n<p>Contains the different versions of the API\n"],["Api::V1","","Api/V1.html","","<p>Module for the functionality of Api version 1.\n<p>Contains the Controllers for the first version of the  …\n"],["Api::V1::ErrorReportsController","","Api/V1/ErrorReportsController.html","","<p>This controller handles API requests related to error reports.\n"],["Api::V1::SessionsController","","Api/V1/SessionsController.html","","<p>This controller handles user sessions using the Devise gem. It inherits from Devise::SessionsController …\n"],["Api::V1::SkriptReportsController","","Api/V1/SkriptReportsController.html","","<p>This controller handles requests related to script reports. It inherits from Api::V1::ErrorReportsController …\n"],["Api::V1::VideoReportsController","","Api/V1/VideoReportsController.html","","<p>This controller handles requests related to video reports records. It inherits from Api::V1::ErrorReportsController …\n"],["ApplicationController","","ApplicationController.html","","<p>Base class for all application controllers.\n"],["ErrorReport","","ErrorReport.html","","<p>belongs to a MitifyUser who created the error report.\n<p>belongs to a UniversityModule in which the error …\n"],["JwtDenylist","","JwtDenylist.html","","<p>Contains all the expired JWT tokens.\n<p>On every authorization the received token is compaired with the items …\n"],["MitifyUser","","MitifyUser.html","","<p>Uses the devise gem to ensure a secure user authorization.\n<p>Autorization is executed with a JWT token. …\n"],["Role","","Role.html","","<p>The role a MitifyUser has.\n<p>Can either be student or Modulverantwortlicher(module supervisor).\n<p>A role can …\n"],["SkriptReport","","SkriptReport.html","","<p>A Child of ErrorReport.\n<p>Script reports concern script-related errors.\n"],["UniversityModule","","UniversityModule.html","","<p>The university module either attended by students or supervised by a Modulverantwortlicher(module supervisor). …\n"],["VideoReport","","VideoReport.html","","<p>A Child of ErrorReport.\n<p>Video reports concern video-related errors.\n"],["create","Api::V1::ErrorReportsController","Api/V1/ErrorReportsController.html#method-i-create","()","<p>POST /error_reports Creates a new error report based on the save_report method. The attributes are obtained …\n"],["create","Api::V1::SkriptReportsController","Api/V1/SkriptReportsController.html#method-i-create","()","<p>POST /skript_reports Creates a new script report based on Api::V1::ErrorReportsController#save_report …\n"],["create","Api::V1::VideoReportsController","Api/V1/VideoReportsController.html#method-i-create","()","<p>POST /video_reports\n<p>Creates a new video report based on Api::V1::ErrorReportsController#save_report method. …\n"],["destroy","Api::V1::ErrorReportsController","Api/V1/ErrorReportsController.html#method-i-destroy","()","<p>DELETE /error_reports/1 Deletes the specified error report.\n"],["get_reports","Api::V1::ErrorReportsController","Api/V1/ErrorReportsController.html#method-i-get_reports","()","<p>Retrieves a list of error reports based on the current MitifyUser ‘s role and the `status` parameter. …\n"],["index","Api::V1::ErrorReportsController","Api/V1/ErrorReportsController.html#method-i-index","()","<p>GET /error_reports\n<p>Retrieves all script reports based on the get_reports method. and returns them as a …\n"],["index","Api::V1::SkriptReportsController","Api/V1/SkriptReportsController.html#method-i-index","()","<p>GET /skript_reports\n<p>Retrieves all script reports based on Api::V1::ErrorReportsController#get_reports …\n"],["index","Api::V1::VideoReportsController","Api/V1/VideoReportsController.html#method-i-index","()","<p>GET /video_reports\n<p>Retrieves all script reports based on Api::V1::ErrorReportsController#get_reports method …\n"],["index_params","Api::V1::ErrorReportsController","Api/V1/ErrorReportsController.html#method-i-index_params","()","<p>Only allow a list of trusted parameters through.\n"],["log_out_failure","Api::V1::SessionsController","Api/V1/SessionsController.html#method-i-log_out_failure","()","<p>Called by ‘resond_to_on_destroy` after a MitifyUser fails to log out. Returns a JSON response with a …\n"],["log_out_success","Api::V1::SessionsController","Api/V1/SessionsController.html#method-i-log_out_success","()","<p>Called by ‘resond_to_on_destroy` after a MitifyUser successfully logs out. Returns a JSON response with …\n"],["report_params","Api::V1::ErrorReportsController","Api/V1/ErrorReportsController.html#method-i-report_params","()","<p>Filters the parameters for creating a new error report.\n"],["report_params","Api::V1::SkriptReportsController","Api/V1/SkriptReportsController.html#method-i-report_params","()","<p>Filters the parameters for creating a new script report record.\n"],["report_params","Api::V1::VideoReportsController","Api/V1/VideoReportsController.html#method-i-report_params","()","<p>Filters the parameters for creating a new script report record.\n"],["resond_to_on_destroy","Api::V1::SessionsController","Api/V1/SessionsController.html#method-i-resond_to_on_destroy","()","<p>Called after a MitifyUser successfully signs out. Checks if there is a current_user and logs them out. …\n"],["respond_with","Api::V1::SessionsController","Api/V1/SessionsController.html#method-i-respond_with","(resource, _opts = {})","<p>Called after a MitifyUser successfully signs in. Returns a JSON response with the user and his role. …\n"],["save_report","Api::V1::ErrorReportsController","Api/V1/ErrorReportsController.html#method-i-save_report","(report)","<p>Sets the current MitifyUser as the author of the report and saves the report to the database.  If the …\n"],["set_error_report","Api::V1::ErrorReportsController","Api/V1/ErrorReportsController.html#method-i-set_error_report","()","<p>Sets the instance variable @error_report to the error report specified by the :id parameter in the request. …\n"],["show","Api::V1::ErrorReportsController","Api/V1/ErrorReportsController.html#method-i-show","()","<p>GET /error_reports/1 Returns the details of a specific error report, including the author.\n"],["update","Api::V1::ErrorReportsController","Api/V1/ErrorReportsController.html#method-i-update","()","<p>PATCH/PUT /error_reports/1\n<p>Updates the specified error report. The attributes are obtained from the ‘report_params` …\n"],["README","","README_md.html","","<p>Correction Management System for iu Distance Learning\n<p>Overview\n<p>This project is a Ruby on Rails API that …\n"]]}}