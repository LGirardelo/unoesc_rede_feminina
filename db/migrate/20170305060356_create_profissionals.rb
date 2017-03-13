class CreateProfissionals < ActiveRecord::Migration[5.0]
  def change
    create_table :profissionals do |t|
      t.string :specialization
      #t.belongs_to :person, index: true
      t.integer :person_id
      t.timestamps
    end
  end
end
