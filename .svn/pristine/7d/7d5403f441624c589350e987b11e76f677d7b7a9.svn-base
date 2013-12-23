# == Schema Information
# Schema version: 21
#
# Table name: pictures
#
#  id           :integer         not null, primary key
#  category_id  :integer
#  description  :text
#  parent_id    :integer
#  content_type :string(255)
#  filename     :string(255)
#  thumbnail    :string(255)
#  size         :integer
#  width        :integer
#  height       :integer
#  position     :integer
#

class Picture < ActiveRecord::Base
  belongs_to :category
#  acts_as_list :scope => :category 
  
#  validates_numericality_of :position
  
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :max_size => 500.kilobytes,
                 :resize_to => '500x376',
                 :thumbnails => { :thumb => '250x188' },
                 :path_prefix => 'public/pictures'

  validates_as_attachment
  
  attr_reader :per_page
  
  
  def self.per_page
    20
  end
  
end
