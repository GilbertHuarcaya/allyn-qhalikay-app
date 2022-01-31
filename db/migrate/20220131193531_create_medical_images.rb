class CreateMedicalImages < ActiveRecord::Migration[6.1]
  def change
    create_table :medical_images do |t|

      t.timestamps
    end
  end
end
