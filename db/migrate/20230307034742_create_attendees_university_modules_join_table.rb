class CreateAttendeesUniversityModulesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :attendees_university_modules, id: false do |t|
      t.references :attendee, foreign_key: {to_table: :mitify_users}
      t.references :attended_module, foreign_key: {to_table: :university_modules}
    end
  end
end