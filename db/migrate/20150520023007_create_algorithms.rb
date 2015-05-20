class CreateAlgorithms < ActiveRecord::Migration
  def change
    create_table :algorithms do |t|
      t.string :name
      t.text :code
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :algorithms, :users
  end
end
