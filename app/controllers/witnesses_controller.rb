class WitnessesController < ApplicationController
  before_action :set_witness, only: [:show, :edit, :update, :destroy]

  # GET /witnesses
  # GET /witnesses.json
  def index
    @witnesses = Witness.all
    respond_to do |format|
      format.xlsx {
        response.headers[
            'Content-Disposition'
        ] = "attachment; filename='Testigos.xlsx'"
      }
      format.html { render :index }
    end
  end

  # GET /witnesses/1
  # GET /witnesses/1.json
  def show
  end

  # GET /witnesses/new
  def new
    @witness = Witness.new
  end

  # GET /witnesses/1/edit
  def edit
  end

  # POST /witnesses
  # POST /witnesses.json
  def create
    @witness = Witness.new(witness_params)

    respond_to do |format|
      if @witness.save
        if params[:crime_id].present?
          format.html { redirect_to crime_path(params[:crime_id]), notice: 'Testigo creado con éxito.' }
          format.json { render :show, status: :created, location: @witness }
        end
      else
        format.html { render :new }
        format.json { render json: @witness.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /witnesses/1
  # PATCH/PUT /witnesses/1.json
  def update
    respond_to do |format|
      if @witness.update(witness_params)
        format.html { redirect_to @witness, notice: 'Textigo actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @witness }
      else
        format.html { render :edit }
        format.json { render json: @witness.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /witnesses/1
  # DELETE /witnesses/1.json
  def destroy
    @witness.destroy
    respond_to do |format|
      format.html { redirect_to witnesses_url, notice: 'Testigo eliminado con éxito' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_witness
      @witness = Witness.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def witness_params
      params.fetch(:witness, {}).permit(:name, :rut, :age, :detalle, :crime_id)
    end
end
