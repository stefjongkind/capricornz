class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.column :title, :string
      t.column :item, :string
      t.column :created_on, :date
      t.column :updated_on, :date
    end
  end

  def self.down
    drop_table :news
  end
end
