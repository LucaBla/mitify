# Uses the devise gem to ensure a secure user authorization.
#
# Autorization is executed with a JWT token.
#
# A User can have multiple ErrorReport 's.
#
# A User can attend multiple UniversityModule 's.
#
# User can have multiple UniversityModule 's he is responsible for.
class MitifyUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  
  has_many :error_reports
  has_many :university_modules, foreign_key: :responsible

  has_and_belongs_to_many :attended_modules, class_name: "UniversityModule",
                          join_table: "attendees_university_modules", foreign_key: "attendee_id",
                          association_foreign_key: "attended_module_id"

  belongs_to :role, default: ->{Role.first}
end
