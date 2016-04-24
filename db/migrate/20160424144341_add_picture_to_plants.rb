class AddPictureToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :picture, :string
  end
end
