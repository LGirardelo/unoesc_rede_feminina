class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :home_phone
      t.string :cell_phone
      t.date :birth_date
      t.string :sex

      t.timestamps
    end
  end
end
