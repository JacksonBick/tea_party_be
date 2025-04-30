class AddImageUrlToTeas < ActiveRecord::Migration[7.1]
  def change
    add_column :teas, :image_url, :string
  end
end
