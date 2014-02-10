class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  include Bootsy::Container

  validates :title, presence: true
  validates :body, presence: true
end
