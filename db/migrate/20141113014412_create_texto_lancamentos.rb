class CreateTextoLancamentos < ActiveRecord::Migration
  def change
    create_table :texto_lancamentos do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
