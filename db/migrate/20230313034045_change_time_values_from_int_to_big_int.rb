class ChangeTimeValuesFromIntToBigInt < ActiveRecord::Migration[7.0]
  def change
    change_column :error_reports, :report_date, :bigint
    change_column :error_reports, :granted_date, :bigint
    change_column :error_reports, :completed_date, :bigint
  end
end