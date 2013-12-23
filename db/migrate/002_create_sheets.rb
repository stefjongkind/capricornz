class CreateSheets < ActiveRecord::Migration
  def self.up
    create_table :sheets do |t|
      # t.column :name, :string
      t.column :category_id, :integer
      t.column :sequence_no, :integer
      t.column :name, :string
    end
  end

  def self.down
    drop_table :sheets
  end
end
