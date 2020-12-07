class CrimeVictimsController < ApplicationController
  before_action :set_crime_victim, only: [:show, :edit, :update, :destroy]

  # GET /crime_victims
  # GET /crime_victims.json
  def index
    @crime_victims = CrimeVictim.all
    @crime_victim = CrimeVictim.where(:crime_id => params[:crime])
    @victim_excel = Victim.where(id:@crime_victim.victim_id)
    respond_to do |format|
      format.xlsx {
        response.headers[
            'Content-Disposition'
        ] = "attachment; filename='Victimas.xlsx'"
      }
      format.html { render :index }
    end
  end

  # GET /crime_victims/1
  # GET /crime_victims/1.json
  def show
  end

  # GET /crime_victims/new
  def new
    @crime_victim = CrimeVictim.new
  end

  # GET /crime_victims/1/edit
  def edit
  end

  # POST /crime_victims
  # POST /crime_victims.json
  def create
    @crime_victim = CrimeVictim.new(crime_victim_params)
    puts("start new")
    puts(params[:crime_id])
    puts(@crime_victim.victim_id)
    @crime_victim.crime_id = params[:crime_id]
    puts("debug")
    @crime = Crime.where(id:@crime_victim.crime_id).first
    respond_to do |format|
      if @crime_victim.save
        format.html { redirect_to @crime, notice: 'Víctima añadida con éxito.' }
        format.json { render :show, status: :created, location: @crime_victim }
      else
        format.html { render :new }
        format.json { render json: @crime_victim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crime_victims/1
  # PATCH/PUT /crime_victims/1.json
  def update
    respond_to do |format|
      if @crime_victim.update(crime_victim_params)
        format.html { redirect_to @crime_victim, notice: 'Víctima actualizada con éxito.' }
        format.json { render :show, status: :ok, location: @crime_victim }
      else
        format.html { render :edit }
        format.json { render json: @crime_victim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crime_victims/1
  # DELETE /crime_victims/1.json
  def destroy
    @crime_victim.destroy
    respond_to do |format|
      format.html { redirect_to crime_victims_url, notice: 'Víctima eliminada con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crime_victim
      @crime_victim = CrimeVictim.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crime_victim_params
      params.fetch(:crime_victim, {}).permit(:victim_id,:crime_id, :relato)
    end
end
