class AddIsDeletedToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :is_deleted, :boolean
  end
end
