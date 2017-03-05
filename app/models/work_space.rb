class WorkSpace < ApplicationRecord
  belongs_to :exercise
  belongs_to :user
  belongs_to :language
end
