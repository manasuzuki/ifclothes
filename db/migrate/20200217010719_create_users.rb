class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :postalcode
      t.string :prefecture
      t.string :address

      t.timestamps
    end
  end
end
