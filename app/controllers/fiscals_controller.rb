class FiscalsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  # GET /fiscals
  # GET /fiscals.json
  def index
    @fiscals = Fiscal.all
  end

  # GET /fiscals/1
  # GET /fiscals/1.json
  def show
    @fiscal = Fiscal.find(params[:id])
    @pertenece = User.find_by(id: @fiscal.user_id)
  end

  # GET /fiscals/new
  def new
    @fiscal = Fiscal.new
  end

  # GET /fiscals/1/edit
  def edit
    @fiscal = Fiscal.find(params[:id])
  end

  # POST /fiscals
  # POST /fiscals.json
  def create
    @fiscal = Fiscal.new(fiscal_params)

    respond_to do |format|
      if @fiscal.save
        format.html { redirect_to @fiscal, notice: 'Fiscal was successfully created.' }
        format.json { render :show, status: :created, location: @fiscal }
      else
        format.html { render :new }
        format.json { render json: @fiscal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fiscals/1
  # PATCH/PUT /fiscals/1.json
  def update
    @fiscal = Fiscal.find(params[:id])
    respond_to do |format|
      if @fiscal.update(fiscal_params)
        format.html { redirect_to @fiscal, notice: 'Fiscal was successfully updated.' }
        format.json { render :show, status: :ok, location: @fiscal }
      else
        format.html { render :edit }
        format.json { render json: @fiscal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fiscals/1
  # DELETE /fiscals/1.json
  def destroy
    @fiscal = Fiscal.find(params[:id])
    @fiscal.destroy
    respond_to do |format|
      format.html { redirect_to fiscals_url, notice: 'Fiscal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fiscal
      @fiscal = Fiscal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fiscal_params
      params.fetch(:fiscal, {}).permit(:name, :phone, :address, :email, :user_id)
    end
end
