class CreateMedicalResults < ActiveRecord::Migration[6.1]
  def change
    create_table :medical_results do |t|

      t.timestamps
    end
  end
end
