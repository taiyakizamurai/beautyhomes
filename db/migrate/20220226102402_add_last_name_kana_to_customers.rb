class AddLastNameKanaToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :last_name_kana, :string
  end
end
