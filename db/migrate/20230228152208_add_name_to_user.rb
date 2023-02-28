class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :mitify_users, :name, :string
    add_column :mitify_users, :first_name, :string
    add_column :mitify_users, :active, :boolean, default: true
  end
end
