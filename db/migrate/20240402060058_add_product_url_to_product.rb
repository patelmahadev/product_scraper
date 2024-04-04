class AddProductUrlToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :url, :text
  end
end
