class CreateParticipacaos < ActiveRecord::Migration
  def change
    create_table :participacaos do |t|
      t.string :dialog
      t.string :titulo
      t.string :imagem
      t.text :texto
      t.text :nota

      t.timestamps
    end
  end
end
