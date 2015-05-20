class AddUserReferenceToDatasets < ActiveRecord::Migration
  def change
    add_reference :datasets, :user, index: true
    add_foreign_key :datasets, :users
  end
end
