class CreateOccassions < ActiveRecord::Migration[6.0]
  def change
    create_table :occassions do |t|
      t.string :occassion
      t.integer :drink_num
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
