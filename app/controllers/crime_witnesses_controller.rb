class CrimeWitnessesController < ApplicationController
  before_action :set_crime_witness, only: [:show, :edit, :update, :destroy]

  # GET /crime_witnesses
  # GET /crime_witnesses.json
  def index
    @crime_witnesses = CrimeWitness.all
  end

  # GET /crime_witnesses/1
  # GET /crime_witnesses/1.json
  def show
  end

  # GET /crime_witnesses/new
  def new
    @crime_witness = CrimeWitness.new
  end

  # GET /crime_witnesses/1/edit
  def edit
  end

  # POST /crime_witnesses
  # POST /crime_witnesses.json
  def create
    @crime_witness = CrimeWitness.new(crime_witness_params)
    puts("start new")
    puts(params[:crime_id])
    puts(@crime_witness.witness_id)
    @crime_witness.crime_id = params[:crime_id]
    puts("debug")
    @crime = Crime.where(id:@crime_witness.crime_id).first
    respond_to do |format|
      if @crime_witness.save
        format.html { redirect_to @crime, notice: 'Testigo añadido con éxito.' }
        format.json { render :show, status: :created, location: @crime_witness }
      else
        format.html { render :new }
        format.json { render json: @crime_witness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crime_witnesses/1
  # PATCH/PUT /crime_witnesses/1.json
  def update
    respond_to do |format|
      if @crime_witness.update(crime_witness_params)
        format.html { redirect_to @crime_witness, notice: 'Testigo actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @crime_witness }
      else
        format.html { render :edit }
        format.json { render json: @crime_witness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crime_witnesses/1
  # DELETE /crime_witnesses/1.json
  def destroy
    @crime_witness.destroy
    respond_to do |format|
      format.html { redirect_to crime_witnesses_url, notice: 'Testigo eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crime_witness
      @crime_witness = CrimeWitness.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crime_witness_params
      params.fetch(:crime_witness, {}).permit(:witness_id,:crime_id, :relato)
    end
end
