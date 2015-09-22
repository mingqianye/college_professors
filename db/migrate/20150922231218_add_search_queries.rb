class AddSearchQueries < ActiveRecord::Migration
  def up
    create_table :search_queries do |t|
      t.string :query_string
      t.boolean :hide_professors
      t.timestamps
    end
  end

  def down
  end
end
