class CreateUniversityModules < ActiveRecord::Migration[7.0]
  def change
    create_table :university_modules do |t|
      t.string :name

      t.timestamps

      t.references :responsible, foreign_key: {to_table: :mitify_users}
    end
  end
end