class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.boolean :active, default: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :c_type
      t.float :coverage
      t.float :premium
      t.boolean :renewable

      t.timestamps
    end
    # TODO: unique index on customer_id, active
  end
end
