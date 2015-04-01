class Ta < ActiveRecord::Base
  attr_accessible :name, :professor_id, :subject_id

  belongs_to :professor
  belongs_to :subject
end
