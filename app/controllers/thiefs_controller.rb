class ThiefsController < ApplicationController
  before_action :set_thief, only: [:show, :edit, :update, :destroy]

  # GET /thiefs
  # GET /thiefs.json
  def index
    @thiefs = Thief.all
    respond_to do |format|
      format.xlsx {
        response.headers[
            'Content-Disposition'
        ] = "attachment; filename='Imputados.xlsx'"
      }
      format.html { render :index }
    end
  end

  # GET /thiefs/1
  # GET /thiefs/1.json
  def show
  end

  # GET /thiefs/new
  def new
    @thief = Thief.new
  end

  # GET /thiefs/1/edit
  def edit
  end

  # POST /thiefs
  # POST /thiefs.json
  def create
    @thief = Thief.new(thief_params)

    respond_to do |format|
      if @thief.save
        if params[:crime_id].present?
          format.html { redirect_to crime_path(params[:crime_id]), notice: 'Imputado creado con éxito.' }
          format.json { render :show, status: :created, location: @thief }
        end

      else
        format.html { render :new }
        format.json { render json: @thief.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thiefs/1
  # PATCH/PUT /thiefs/1.json
  def update
    respond_to do |format|
      if @thief.update(thief_params)
        format.html { redirect_to @thief, notice: 'Imputado actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @thief }
      else
        format.html { render :edit }
        format.json { render json: @thief.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thiefs/1
  # DELETE /thiefs/1.json
  def destroy
    @thief.destroy
    respond_to do |format|
      format.html { redirect_to thiefs_url, notice: 'Imputado eliminado con éxito' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thief
      @thief = Thief.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def thief_params
      params.fetch(:thief, {}).permit(:name,:rut,:tags,:alias_list,:crime_id)
    end
end
