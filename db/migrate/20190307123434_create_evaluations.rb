class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.integer :value

      t.timestamps
    end
  end
end
