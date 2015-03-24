class AddCounterCacheToProf < ActiveRecord::Migration
  def change
    add_column :professors, :count_of_subjects, :integer, :default => 0
  end
end
