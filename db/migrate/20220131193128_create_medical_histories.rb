class CreateMedicalHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :medical_histories do |t|
      t.references :clinic, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :appointment

      t.timestamps
    end
  end
end
