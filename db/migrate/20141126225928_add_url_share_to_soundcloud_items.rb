class AddUrlShareToSoundcloudItems < ActiveRecord::Migration
  def change
    add_column :soundcloud_items, :url_share, :string
  end
end
