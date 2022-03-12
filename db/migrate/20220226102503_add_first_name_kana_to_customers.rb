class AddFirstNameKanaToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :first_name_kana, :string
  end
end
