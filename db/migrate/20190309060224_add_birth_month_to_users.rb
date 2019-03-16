class AddBirthMonthToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birth_month, :integer, null: false
  end
end
