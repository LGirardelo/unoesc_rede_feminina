json.extract! person, :id, :name, :cpf, :rg, :homePhone, :cellPhone, :birthDate, :sex, :created_at, :updated_at
json.url person_url(person, format: :json)
