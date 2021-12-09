class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
      t.string :enderecoemail
      t.string :observacao
      t.references :pessoa, foreign_key: true

      t.timestamps
    end
  end
end
