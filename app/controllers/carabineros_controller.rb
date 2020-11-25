class CarabinerosController < ApplicationController
  before_action  only: [:show, :edit, :update, :destroy]
  # :set_carabinero
  #
  # GET /carabineros
  # GET /carabineros.json
  def index
    @carabineros = Carabinero.all
  end

  # GET /carabineros/1
  # GET /carabineros/1.json
  def show
    @carabinero = Carabinero.find(params[:id])
    @pertenece = User.find_by(id: @carabinero.user_id)
  end

  # GET /carabineros/new
  def new
    @carabinero = Carabinero.new
  end

  # GET /carabineros/1/edit
  def edit
    @carabinero = Carabinero.find(params[:id])
  end

  # POST /carabineros
  # POST /carabineros.json
  def create
    @carabinero = Carabinero.new(carabinero_params)

    respond_to do |format|
      if @carabinero.save
        format.html { redirect_to @carabinero, notice: 'Usuario de Carabinero creado con exito' }
        format.json { render :show, status: :created, location: @carabinero }
      else
        format.html { render :new }
        format.json { render json: @carabinero.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carabineros/1
  # PATCH/PUT /carabineros/1.json
  def update
    @carabinero = Carabinero.find(params[:id])
    respond_to do |format|
      if @carabinero.update(carabinero_params)
        format.html { redirect_to @carabinero, notice: 'Usuario de carabinero actualizado con exito' }
        format.json { render :show, status: :ok, location: @carabinero }
      else
        format.html { render :edit }
        format.json { render json: @carabinero.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carabineros/1
  # DELETE /carabineros/1.json
  def destroy
    @carabinero = Carabinero.find(params[:id])
    @carabinero.destroy
    respond_to do |format|
      format.html { redirect_to carabineros_url, notice: 'Usuario de carabinero creeado con exito' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carabinero
      @carabinero = Carabinero.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def carabinero_params
      params.fetch(:carabinero, {}).permit(:name, :phone, :address, :email, :user_id)
    end
end
