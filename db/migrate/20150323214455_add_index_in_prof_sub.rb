class AddIndexInProfSub < ActiveRecord::Migration
  def change
    add_index :professors_subjects, :professor_id
    add_index :professors_subjects, :subject_id
  end
end
