class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :scientific_name
      t.text :description

      t.timestamps null: false
    end
  end
end
