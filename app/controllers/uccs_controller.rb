class UccsController < ApplicationController
  before_action :set_ucc, only: [:show, :edit, :update, :destroy]

  # GET /uccs
  # GET /uccs.json
  def index
    @uccs = Ucc.all
  end

  # GET /uccs/1
  # GET /uccs/1.json
  def show
  end

  # GET /uccs/new
  def new
    @ucc = Ucc.new
  end

  # GET /uccs/1/edit
  def edit
  end

  # POST /uccs
  # POST /uccs.json
  def create
    @ucc = Ucc.new(ucc_params)
    respond_to do |format|
      if @ucc.save
        format.html { redirect_to new_ucc_path, notice: 'Union creada con exito' }
        format.json { render :show, status: :created, location: @ucc }
      else
        format.html { render :new }
        format.json { render json: @ucc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uccs/1
  # PATCH/PUT /uccs/1.json
  def update
    respond_to do |format|
      if @ucc.update(ucc_params)
        format.html { redirect_to @ucc, notice: 'Ucc was successfully updated.' }
        format.json { render :show, status: :ok, location: @ucc }
      else
        format.html { render :edit }
        format.json { render json: @ucc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uccs/1
  # DELETE /uccs/1.json
  def destroy
    @ucc.destroy
    respond_to do |format|
      format.html { redirect_to uccs_url, notice: 'Ucc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ucc
      @ucc = Ucc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ucc_params
      params.fetch(:ucc, {}).permit(:user_id,:carabineros_id)
    end
end
