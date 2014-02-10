class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  include Bootsy::Container
end
