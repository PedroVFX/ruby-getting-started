class WelcomeController < ApplicationController
  before_action :youtube_items, :soundcloud_items, :texto_lancamentos, :vimeo_items, only: [:index] 

  # GET /welcome
  def index

  end

  def youtube_items
    @youtube_items = YoutubeItem.all.order('updated_at DESC')
  end

  def vimeo_items
    @vimeo_items = VimeoItem.all.order('updated_at DESC')
  end

  def soundcloud_items
    @soundcloud_items = SoundcloudItem.all.order('updated_at DESC')
  end

  def texto_lancamentos
    @texto_lancamentos = TextoLancamento.all.order('updated_at DESC')
  end


end
