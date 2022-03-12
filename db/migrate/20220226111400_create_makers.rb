class CreateMakers < ActiveRecord::Migration[5.0]
  def change
    create_table :makers do |t|
      t.string :name
      t.string :image_id
      t.text :introduction
      t.timestamps
    end
  end
end
