class AddCounterCacheToProf < ActiveRecord::Migration
  def change
    add_column :professors, :subjects_count, :integer, :default => 0
  end
end
