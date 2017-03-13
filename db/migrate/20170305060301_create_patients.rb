class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :sus_card_number
      t.string :profissional_address
      t.string :home_address
      t.string :conjugal_name
      t.string :profession_conjugate
      t.string :conjugate_contact
      t.boolean :have_children
      t.integer :number_of_children
      t.string :age_children
      t.string :note
      t.string :local_birth
      t.date :date_register
      t.date :date_obtained
      t.boolean :active
      #t.belongs_to :person, index: true
      t.integer :person_id
      t.timestamps
    end
  end
end
