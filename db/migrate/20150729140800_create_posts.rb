class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :author
      t.string :date
      t.string :title
      t.text :content
    end
  end
end
