class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :doctor, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
    add_column :users, :phone, :string
  end
end
