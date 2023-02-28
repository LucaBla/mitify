class AddUserReferenceToReport < ActiveRecord::Migration[7.0]
  def change
    add_reference :error_reports, :mitify_user, foreign_key: true
  end
end
