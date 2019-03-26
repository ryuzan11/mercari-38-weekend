class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string   "name",                          null: false
      t.integer  "price",                         null: false
      t.text     "condition",                     null: false
      t.string   "status",                        null: true
      t.text     "info",                          null: false
      t.string   "size",                          null: true
      t.string  "delivery_fee",                  null: false
      t.string   "delivery_method",               null: false
      t.string   "departure_area",                null: false
      t.string   "departure_day",                 null: false
      t.integer  "buyer_id"
      t.references  "user", foreign_key: true,      null: false
      t.references  "category", foreign_key: true,  null: false
      t.references  "brand", foreign_key: true,     null: true
      t.timestamps
    end
  end
end
