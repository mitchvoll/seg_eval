class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :name
      t.string :filename
      t.string :thumbnail
      t.string :description
      t.integer :height
      t.integer :width
      t.integer :frames

      t.timestamps null: false
    end
  end
end
