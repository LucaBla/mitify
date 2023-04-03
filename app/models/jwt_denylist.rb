# Contains all the expired JWT tokens.
#
# On every authorization the received token is compaired with the items in this list.
#
# If the received token and an item in the list are equal
# the received token is invalid and authorization fails.
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'
end
