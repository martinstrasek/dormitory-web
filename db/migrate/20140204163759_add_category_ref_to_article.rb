class AddCategoryRefToArticle < ActiveRecord::Migration
  def change
    add_reference :articles, :category, index: true
  end
end
