class AddSecondNameKanaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :second_name_kana, :string, null: false
  end
end
