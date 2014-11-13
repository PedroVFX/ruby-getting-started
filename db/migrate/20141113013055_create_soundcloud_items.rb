class CreateSoundcloudItems < ActiveRecord::Migration
  def change
    create_table :soundcloud_items do |t|
      t.string :item
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
