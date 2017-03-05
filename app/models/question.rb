class Question < ApplicationRecord
  has_many :Answers
  has_many :Quizzes, through: :Answers
end
