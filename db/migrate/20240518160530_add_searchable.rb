class AddSearchable < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def up
    execute <<-SQL
      ALTER TABLE recipes
      ADD COLUMN searchable tsvector GENERATED ALWAYS AS (
        setweight(jsonb_to_tsvector('english', ingredients, '["string"]'), 'a')
      ) STORED;
    SQL

    add_index :recipes, :searchable, using: :gin, algorithm: :concurrently
  end

  def down
    remove_index :recipes, :searchable
    remove_column :recipes, :searchable
  end
end
