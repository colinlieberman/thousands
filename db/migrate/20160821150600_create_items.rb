class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      # index to make sorting faster
      t.integer :length_mm, null: false, required: true, limit: 16, index: true
      t.text :name, null: false, required: true, index: true
      t.timestamps
    end
  end
end
