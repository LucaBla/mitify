class CreateErrorReports < ActiveRecord::Migration[7.0]
  def change
    create_table :error_reports do |t|
      t.string :type, null: false
      t.string :reportType
      t.string :module
      t.text :description
      t.string :status
      t.integer :priority
      t.string :author
      t.string :eMail

      #SkriptReportParams
      t.integer :page
      t.integer :chapter
      t.integer :illustrationNumber
      t.integer :tableNumber

      #VideoReportParams
      t.string :videoTitle
      t.integer :timestampStart
      t.integer :timestampEnd
      t.string :videoURL

      t.timestamps
    end
  end
end
