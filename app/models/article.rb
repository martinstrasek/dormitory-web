class Article < ActiveRecord::Base
  include Bootsy::Container

  belongs_to :user
  belongs_to :category
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
end
