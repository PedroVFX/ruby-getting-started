class CreateVimeoItems < ActiveRecord::Migration
  def change
    create_table :vimeo_items do |t|
      t.string :item
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
