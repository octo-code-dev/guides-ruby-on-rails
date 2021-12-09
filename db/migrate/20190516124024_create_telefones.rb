class CreateTelefones < ActiveRecord::Migration[5.2]
  def change
    create_table :telefones do |t|
      t.string :numero
      t.string :tipo
      t.string :contato
      t.references :pessoa, foreign_key: true

      t.timestamps
    end
  end
end
