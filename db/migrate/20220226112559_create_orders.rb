class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    t.integer :customer_id
    t.string :postal_code
    t.string :address
    t.string :name
    t.integer :shipping_cost
    t.integer :total_payment
    t.integer :payment_method
    t.integer :status, default: 0
    t.datetime :created_at, null: false
    t.datetime :updated_at, null: false
    end
  end
end
