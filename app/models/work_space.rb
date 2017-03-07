class WorkSpace < ApplicationRecord
  belongs_to :user
  belongs_to :language
  has_many :work_space_users
end
