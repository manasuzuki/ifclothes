class CreateBuyings < ActiveRecord::Migration[5.2]
  def change
    create_table :buyings do |t|
      t.references :user, foreign_key: true #userデータをbuyingsテーブルに入れたい
      t.references :post, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :post_id], unique: true
    end
  end
end
