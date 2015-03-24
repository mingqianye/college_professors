class ProfessorsSubject < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :professor, counter_cache: :subjects_count
  belongs_to :subject
end
