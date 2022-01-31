class CreateClinics < ActiveRecord::Migration[6.1]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :description

      t.timestamps
    end
  end
end
