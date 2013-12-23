class ChangePictureDescriptionToText < ActiveRecord::Migration
  def self.up
    change_column :pictures, :description, :text
  end

  def self.down
    change_column :pictures, :description, :string
  end
end
