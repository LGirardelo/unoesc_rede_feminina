class Answer < ApplicationRecord
	belongs_to :Question
	belongs_to :Quiz
end
