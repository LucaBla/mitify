# Correction Management System for iu Distance Learning
## Overview
This project is a Ruby on Rails API that provides a correction management system for the iu. The system was developed to quickly and easily report and manage errors, suggestions for improvement, and additions to materials. It allows for central collection, categorization, assignment, and evaluation of all reports and provides traceability throughout the life cycle of a report until it is implemented or rejected.

The correction management system was specifically designed for the needs of the iu and provides a user-friendly interface for all relevant stakeholders, such as students and module coordinators.

The current prototype of the API focuses on reporting errors. Suggestions for improvement, and additions are not yet considered.

## Technologies and Tools
The correction management API was developed using Ruby on Rails and uses PostgreSQL as its database. Devise gem in conjunction with Devise-JWT was used for user management. Salesforce's Heroku is used as the Backend server host.

## Usage
The API is connected to an Angular frontend to enable user interaction. This was created by [Patrick Pußwald](https://github.com/Xorcarrot). You can find this frontend at: https://xorcarrot.github.io/mitify/.

## Endpoints
**User:**
```ruby
  POST /mitify_users/sign_in - #to log in the user

  DELETE /mitify_users/sign_out - #to log out the user
```

**Authorization header required:**
```ruby
GET /api/v1/error_reports - #returns a user's reports.

GET /api/v1/skript_reports - #returns a user's reports related to a script.

GET /api/v1/video_reports - #returns a user's reports related to a video.
```
```ruby
GET /api/v1/error_reports/:id - #returns the report defined by id.
```
```ruby
POST /api/v1/skript_reports - #creates a script report.

POST /api/v1/video_reports - #creates a video report.
```
```ruby
PATCH /api/v1/skript_reports/:id - #updates the script report defined by id.

PATCH /api/v1/video_reports/:id - #updates the video report defined by id.
```
```ruby
DELETE /error_reports/:id - #deletes a report.
```

## Authentication
To ensure the security of the API, authentication is required.
Each user must send a valid JWT token in the header request to access the endpoints.
This token is issued as an authorization header upon login and is used to authorize the user for further API requests.
Upon logout or token expiration (1 hour), it is added to a list of invalid tokens.

## Return values
Reports are returned in JSON format.<br><br>
 **Each entry contains at least:**
* :reportType
* :description
* :status
* :priority
* :author
* :eMail (des Authors)
* :report_date
* :granted_date
* :completed_date
* :university_module

**Script report specific:**
* :page
* :chapter
* :illustrationNumber
* :tableNumber

**Video report specific:**
* :videoTitle
* :timestampStart
* :timestampEnd
* :videoURL