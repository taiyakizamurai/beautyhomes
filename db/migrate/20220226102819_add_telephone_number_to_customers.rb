class AddTelephoneNumberToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :telephone_number, :string
  end
end
