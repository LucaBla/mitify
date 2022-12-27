class CreateErrorReports < ActiveRecord::Migration[7.0]
  def change
    create_table :error_reports do |t|
      t.string :module
      t.text :description

      t.timestamps
    end
  end
end
