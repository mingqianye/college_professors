class ProfessorsSubject < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :professor, counter_cache: :count_of_subjects
  belongs_to :subject
end
