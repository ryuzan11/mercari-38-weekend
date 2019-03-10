class AddSecondNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :second_name, :string, null: false
  end
end
