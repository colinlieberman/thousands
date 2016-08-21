class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :length_mm, null: false, required: true, limit: 8
      t.text :name, null: false, required: true, index: true
      t.timestamps
    end
  end
end
