class YoutubeItemsController < ApplicationController
  before_action :signed_in_user,
                only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  #Desta maneira so o admin e que remove o(s) youtube(s)
  #before_action :admin_user,     only: :destroy
  before_action :set_youtube_item, only: [:show, :edit, :update, :destroy]

  # GET /youtube_items
  # GET /youtube_items.json
  def index
    @youtube_items = YoutubeItem.all
  end

  # GET /youtube_items/1
  # GET /youtube_items/1.json
  def show
  end

  # GET /youtube_items/new
  def new
    @youtube_item = YoutubeItem.new
  end

  # GET /youtube_items/1/edit
  def edit
  end

  # POST /youtube_items
  # POST /youtube_items.json
  def create
    @youtube_item = YoutubeItem.new(youtube_item_params)

    respond_to do |format|
      if @youtube_item.save
        format.html { redirect_to @youtube_item, notice: 'Youtube item was successfully created.' }
        format.json { render :show, status: :created, location: @youtube_item }
      else
        format.html { render :new }
        format.json { render json: @youtube_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /youtube_items/1
  # PATCH/PUT /youtube_items/1.json
  def update
    respond_to do |format|
      if @youtube_item.update(youtube_item_params)
        format.html { redirect_to @youtube_item, notice: 'Youtube item was successfully updated.' }
        format.json { render :show, status: :ok, location: @youtube_item }
      else
        format.html { render :edit }
        format.json { render json: @youtube_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /youtube_items/1
  # DELETE /youtube_items/1.json
  def destroy
    @youtube_item.destroy
    respond_to do |format|
      format.html { redirect_to youtube_items_url, notice: 'Youtube item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_youtube_item
      @youtube_item = YoutubeItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def youtube_item_params
      params.require(:youtube_item).permit(:item, :nome, :descricao)
    end

    # Before filters
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
