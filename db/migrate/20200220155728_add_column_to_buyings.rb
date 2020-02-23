class AddColumnToBuyings < ActiveRecord::Migration[5.2]
  def change
    add_column :buyings, :status, :string
  end
end
