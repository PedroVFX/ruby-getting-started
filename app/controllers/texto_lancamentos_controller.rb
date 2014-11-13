class TextoLancamentosController < ApplicationController
  before_action :set_texto_lancamento, only: [:show, :edit, :update, :destroy]

  # GET /texto_lancamentos
  # GET /texto_lancamentos.json
  def index
    @texto_lancamentos = TextoLancamento.all
  end

  # GET /texto_lancamentos/1
  # GET /texto_lancamentos/1.json
  def show
  end

  # GET /texto_lancamentos/new
  def new
    @texto_lancamento = TextoLancamento.new
  end

  # GET /texto_lancamentos/1/edit
  def edit
  end

  # POST /texto_lancamentos
  # POST /texto_lancamentos.json
  def create
    @texto_lancamento = TextoLancamento.new(texto_lancamento_params)

    respond_to do |format|
      if @texto_lancamento.save
        format.html { redirect_to @texto_lancamento, notice: 'Texto lancamento was successfully created.' }
        format.json { render :show, status: :created, location: @texto_lancamento }
      else
        format.html { render :new }
        format.json { render json: @texto_lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texto_lancamentos/1
  # PATCH/PUT /texto_lancamentos/1.json
  def update
    respond_to do |format|
      if @texto_lancamento.update(texto_lancamento_params)
        format.html { redirect_to @texto_lancamento, notice: 'Texto lancamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @texto_lancamento }
      else
        format.html { render :edit }
        format.json { render json: @texto_lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texto_lancamentos/1
  # DELETE /texto_lancamentos/1.json
  def destroy
    @texto_lancamento.destroy
    respond_to do |format|
      format.html { redirect_to texto_lancamentos_url, notice: 'Texto lancamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_texto_lancamento
      @texto_lancamento = TextoLancamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def texto_lancamento_params
      params.require(:texto_lancamento).permit(:nome, :descricao)
    end
end
