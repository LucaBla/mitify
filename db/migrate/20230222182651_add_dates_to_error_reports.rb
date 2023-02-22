class AddDatesToErrorReports < ActiveRecord::Migration[7.0]
  def change
    add_column :error_reports, :report_date, :integer
    add_column :error_reports, :granted_date, :integer
    add_column :error_reports, :completed_date, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
