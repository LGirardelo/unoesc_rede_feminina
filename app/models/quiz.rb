class Quiz < ApplicationRecord
  has_many :Answers
  has_many :Questions, through: :Answers
end
