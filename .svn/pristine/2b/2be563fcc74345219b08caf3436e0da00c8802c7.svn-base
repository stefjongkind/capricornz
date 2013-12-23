# == Schema Information
# Schema version: 21
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  photo_path  :string(255)
#  description :text
#  parent_id   :integer
#  lft         :integer
#  rgt         :integer
#  depth       :integer
#

class Category < ActiveRecord::Base
  has_many :pictures, :order =>:position
  
  # Behaviours
  acts_as_nested_set
  # Callbacks
  after_save :update_depth
  # Validations  
  validates_uniqueness_of :name
  validates_presence_of :name
  
  attr_reader :per_page

  def update_depth
    unless self.level == self.depth
      self.update_attribute(:depth, self.level)
      self.children.each{|child| child.update_depth }
    end
  end

  def self.per_page
    60
  end
  
  def self.search_all(page)
    paginate  :page => page,
              :order => 'name'
  end
  
  
end
