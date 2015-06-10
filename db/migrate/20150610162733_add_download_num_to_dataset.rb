class AddDownloadNumToDataset < ActiveRecord::Migration
  def change
    add_column :datasets, :download_num, :int
  end
end
