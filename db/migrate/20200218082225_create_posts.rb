class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :name
      t.string :price
      t.string :color
      t.string :size
      t.string :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
