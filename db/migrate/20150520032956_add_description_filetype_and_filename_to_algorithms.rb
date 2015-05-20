class AddDescriptionFiletypeAndFilenameToAlgorithms < ActiveRecord::Migration
  def change
    add_column :algorithms, :description, :text
    add_column :algorithms, :filetype, :string
    add_column :algorithms, :filename, :string
  end
end
