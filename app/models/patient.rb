class Patient < ApplicationRecord
	
	belongs_to :person
	delegate :name, :cpf, :rg, :home_phone, :cell_phone, :birth_date, :sex, :to => :person

	accepts_nested_attributes_for :person

end
