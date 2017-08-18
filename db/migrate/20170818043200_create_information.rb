class CreateInformation < ActiveRecord::Migration[5.1]
  def change
    create_table :information do |t|
      t.text :text
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
