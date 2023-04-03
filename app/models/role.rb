# The role a MitifyUser has.
#
# Can either be student or Modulverantwortlicher(module supervisor).
#
# A role can be hold by multiple MitifyUser 's.
class Role < ApplicationRecord
  has_many :mitify_users
end
