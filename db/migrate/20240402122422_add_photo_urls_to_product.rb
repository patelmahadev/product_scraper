class AddPhotoUrlsToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :image_urls, :string
  end
end
