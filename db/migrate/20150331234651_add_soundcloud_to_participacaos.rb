class AddSoundcloudToParticipacaos < ActiveRecord::Migration
  def change
    add_column :participacaos, :url_code_share, :string
    add_column :participacaos, :soundcloud_item, :string
  end
end
