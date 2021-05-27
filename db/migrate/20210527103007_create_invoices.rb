class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.belongs_to :contract, null: false, foreign_key: true
      t.float :amount
      t.date :date
      t.boolean :is_paid, default: false
      t.text :payment_details

      t.timestamps
    end
  end
end
