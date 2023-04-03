# belongs to a MitifyUser who created the error report.
#
# belongs to a UniversityModule in which the error occurred.
class ErrorReport < ApplicationRecord
  belongs_to :mitify_user
  belongs_to :university_module
end
