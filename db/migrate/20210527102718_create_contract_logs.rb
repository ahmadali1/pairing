class CreateContractLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :contract_logs do |t|
      t.belongs_to :contract, null: false, foreign_key: true
      t.date :adjusted_at
      t.float :previous_premium
      t.text :reason

      t.timestamps
    end
  end
end
