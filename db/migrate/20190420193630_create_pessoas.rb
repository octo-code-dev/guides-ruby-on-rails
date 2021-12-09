class CreatePessoas < ActiveRecord::Migration[5.2]
  def change
    create_table :pessoas do |t|
      t.string :nomecompletoourazaosocial
      t.string :nomefantasia
      t.string :cpfoucnpj
      t.string :inscricaoestadual
      t.string :rg

      t.timestamps
    end
  end
end
