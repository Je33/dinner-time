class CreateRecipes < ActiveRecord::Migration[7.1]
  def up
    create_table :recipes do |t|
      t.string :title, default: "", null: false
      t.integer :cook_time, default: 0, null: false
      t.integer :prep_time, default: 0, null: false
      t.decimal :ratings, precision: 5, scale: 2, default: 0.0, null: false
      t.string :cuisine, default: "", null: false
      t.string :category, default: "", null: false
      t.string :author, default: "", null: false
      t.string :image, default: "", null: false
      t.jsonb :ingredients, default: [], null: false

      t.timestamps
    end

    add_index :recipes, :category
    add_index :recipes, :ratings
    add_index :recipes, :cuisine
    add_index :recipes, :cook_time
  end

  def down
    drop_table :recipes
  end
end
