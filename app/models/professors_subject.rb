class ProfessorsSubject < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :professor
  belongs_to :subject
end
