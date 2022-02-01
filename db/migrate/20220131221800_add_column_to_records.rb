class AddColumnToRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :records, :history, :boolean, default: false
  end
end
