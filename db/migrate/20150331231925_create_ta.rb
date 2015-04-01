class CreateTa < ActiveRecord::Migration
  def change
    create_table :ta do |t|
      t.string :name
      t.integer :subject_id
      t.integer :professor_id

      t.timestamps
    end

    add_index :ta, :subject_id
    add_index :ta, :professor_id
  end
end
