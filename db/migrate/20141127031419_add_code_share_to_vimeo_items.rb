class AddCodeShareToVimeoItems < ActiveRecord::Migration
  def change
    add_column :vimeo_items, :code_share, :string
  end
end
