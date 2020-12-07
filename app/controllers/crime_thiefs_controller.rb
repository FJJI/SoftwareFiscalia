class CrimeThiefsController < ApplicationController
  before_action :set_crime_thief, only: [:show, :edit, :update, :destroy]

  # GET /crime_thiefs
  # GET /crime_thiefs.json
  def index
    @crime_thiefs = CrimeThief.all
  end

  # GET /crime_thiefs/1
  # GET /crime_thiefs/1.json
  def show
  end

  # GET /crime_thiefs/new
  def new
    @crime_thief = CrimeThief.new
  end

  # GET /crime_thiefs/1/edit
  def edit
  end

  # POST /crime_thiefs
  # POST /crime_thiefs.json
  def create
    @crime_thief = CrimeThief.new(crime_thief_params)
    puts("start new")
    puts(params[:crime_id])
    puts(@crime_thief.thief_id)
    @crime_thief.crime_id = params[:crime_id]
    @crime_thief.pronunciado = false
    @crime_thief.estado = "sin pronunciar"
    puts("debug")
    @crime = Crime.where(id:@crime_thief.crime_id).first
    respond_to do |format|
      if @crime_thief.save
        format.html { redirect_to @crime, notice: 'Autor añadido con éxito.' }
        format.json { render :show, status: :created, location: @crime}
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /crime_thiefs/1
  # PATCH/PUT /crime_thiefs/1.json
  def update
    cri = @crime_thief.crime_id
    cre = Crime.where(id:cri).first
    respond_to do |format|
      if @crime_thief.update(crime_thief_params)
        format.html { redirect_to cre, notice: 'Cambio de estado exitoso!' }
        format.json { render :show, status: :ok, location: @crime_thief }
      else
        format.html { render :edit }
        format.json { render json: @crime_thief.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crime_thiefs/1
  # DELETE /crime_thiefs/1.json
  def destroy
    @crime_thief.destroy
    respond_to do |format|
      format.html { redirect_to crime_thiefs_url, notice: 'Procedimiento eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  def pronunciado
    return false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crime_thief
      @crime_thief = CrimeThief.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crime_thief_params
      params.fetch(:crime_thief, {}).permit(:thief_id,:crime_id,:estado, :marca)

    end
end
