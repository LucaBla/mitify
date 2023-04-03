# The university module either attended by students or supervised by a
# Modulverantwortlicher(module supervisor).
# Both are MitifyUser 's.
#
# Has multiple ErrorReport 's belonging to this university module.
class UniversityModule < ApplicationRecord
  belongs_to :responsible, class_name: "MitifyUser", foreign_key: "responsible_id"
  has_many :error_reports
  has_and_belongs_to_many :attendees, class_name: "MitifyUser",
                          join_table:"attendees_university_modules", foreign_key: "attended_module_id",
                          association_foreign_key: "attendee_id"
end