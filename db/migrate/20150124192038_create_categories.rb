class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      
      # эта строчка добавит числовой столбец с именем `brand_id`.
      t.references :brand, index: true

      t.timestamps
    end
  end
end
