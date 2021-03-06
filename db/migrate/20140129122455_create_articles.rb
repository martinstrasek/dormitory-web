class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :user, index: true
      t.boolean :published

      t.timestamps
    end
  end
end
