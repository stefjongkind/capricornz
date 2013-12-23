class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      # t.column :name, :string
      t.column :page_id, :integer
      t.column :name, :string
    end
  end

  def self.down
    drop_table :photos
  end
end
