class CreateMedicalResults < ActiveRecord::Migration[6.1]
  def change
    create_table :medical_results do |t|
      t.string :title
      t.references :record, null: false, foreign_key: true

      t.timestamps
    end
  end
end
