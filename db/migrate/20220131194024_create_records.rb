class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.references :clinic, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :appointment
      t.references :medical_image, null: false, foreign_key: true
      t.references :medical_result, null: false, foreign_key: true
      t.references :prescription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
