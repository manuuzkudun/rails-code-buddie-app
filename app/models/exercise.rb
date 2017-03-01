class Exercise < ApplicationRecord
  belongs_to :language
  has_many :exercise_files
  has_many :exercise_submissions
  has_many :exercise_comments
end
