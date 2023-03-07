class AddUniversityModuleAndRemoveModuleFromReport < ActiveRecord::Migration[7.0]
  def change
    add_reference :error_reports, :university_module, index: true
    remove_column :error_reports, :module
  end
end
