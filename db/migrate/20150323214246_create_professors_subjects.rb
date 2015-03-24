class CreateProfessorsSubjects < ActiveRecord::Migration
  def change
    create_table :professors_subjects do |t|
      t.belongs_to :professor
      t.belongs_to :subject
      t.timestamps
    end
  end
end
