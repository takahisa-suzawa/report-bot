class CreateReports < ActiveRecord::Migration[5.1]
  def change
    drop_table :reports
    create_table :reports do |t|
      t.date :deliver_date

      t.timestamps
    end
  end
end
