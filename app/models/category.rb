class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent, :class_name => "Category"
  has_many :articles

  def ancestors
  	[parent, parent.try(:ancestors)].compact.flatten
  end

end