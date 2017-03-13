class Person < ApplicationRecord

	has_one :patient
  has_one :profissional

  accepts_nested_attributes_for :patient
  accepts_nested_attributes_for :profissional
end
