class AddReferenceToRole < ActiveRecord::Migration[7.0]
  def change
    add_reference :mitify_users, :role, references: :user, foreign_key: true
  end
end
