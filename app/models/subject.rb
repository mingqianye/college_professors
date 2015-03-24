class Subject < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :professors, through: :professors_subjects
end
