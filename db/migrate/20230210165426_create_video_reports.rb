class CreateVideoReports < ActiveRecord::Migration[7.0]
  def change
    create_table :video_reports do |t|

      t.timestamps
    end
  end
end
