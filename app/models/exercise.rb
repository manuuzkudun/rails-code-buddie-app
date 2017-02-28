class Exercise < ApplicationRecord
  belongs_to :language
  has_many :exercise_files
end

