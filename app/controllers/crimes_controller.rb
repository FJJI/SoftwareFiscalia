class CrimesController < ApplicationController
  before_action :set_crime, only: [:show, :edit, :update, :destroy]
  # GET /crimes
  # GET /crimes.json
  def index
    require 'date'
    @date_a = DateTime.now() 
    @crimes = Crime.all
    @crimes_p = Crime.joins("INNER JOIN users ON users.region == crimes.region  ").where(:estado => 'Pendiente').where(:region => current_user.region).distinct
    @crimes_b = Crime.joins("INNER JOIN users ON users.region == crimes.region ").where(:estado => 'Borrador').where(:region => current_user.region).distinct
    @crimes_c = Crime.joins("INNER JOIN users ON users.region == crimes.region ").where(:estado => 'Cerrado').where(:region => current_user.region).distinct
    @cops = Carabinero.where(:user_id => current_user.id)
    @fiscales = Fiscal.where(:user_id => current_user.id)
  end

  def btop
    crime_idd = params[:crime_id]
    crime_buffer = Crime.where(id:crime_idd).first
    if crime_buffer.estado == "Borrador"
      crime_buffer.estado = "Pendiente"
      crime_buffer.save!

    elsif crime_buffer.estado == "Pendiente"
      crime_buffer.estado = "Cerrado"
      crime_buffer.save!
    end
    respond_to do |format|
      format.html { redirect_to crime_buffer, notice: 'Cambio de estado exitoso.' }
      format.json { render :show, status: :created, location: @crime }
    end
  end

  def search
    if params[:q] != ""
      data = params[:q]
      @dataa = data
      if current_person.Admin?
        @uniformados = Carabinero.where("name LIKE ?","%"+params[:q]+"%")
        @crimenes = Crime.where("title LIKE ?","%"+params[:q]+"%")
        @victimas = Victim.where("name LIKE ?","%"+params[:q]+"%")
        alll = User.where("name LIKE ?","%"+params[:q]+"%")
        #@fiscales = alll.where(job:"fiscal")
        @carabineros = alll
      end
      if current_person.Carabinero?
        total_crimenes = Crime.where("title LIKE ?","%"+params[:q]+"%")
        @uniformados=  Carabinero.where("name LIKE ?","%"+params[:q]+"%")
        #unidad = total_crimenes.where(user_id:)
        @crimenes = total_crimenes

      end
      if current_person.Fiscal?
        @crimenes = Crime.where("title LIKE ?","%"+params[:q]+"%")
        @uniformados = Carabinero.where("name LIKE ?","%"+params[:q]+"%")
        @victimas = Victim.where("name LIKE ?","%"+params[:q]+"%")
      end
    end
  end
  # GET /crimes/1
  # GET /crimes/1.json
  def show
    crime_idd = params[:crime_id]
    @var = TRUE
    #if CrimeThief.where(crime_id: crime_idd && estado: '')
    @messages = Message.all
    @crime_users = User.all
    @message_crimes = Message.joins(:crime).all
    @tags = CrimeTag.find(@crime.labels)

    # @creado_por = Ucc.where(carabineros_id: @crime.carabineros_id, ).pluck(:carabineros_id).first
     @cp = Carabinero.find(@crime.carabineros_id)
     @cf = Fiscal.find(@crime.fiscals_id)


  end

  # GET /crimes/new
  def new
    @crime = Crime.new
    # @idc = Ucc.where(user_id: current_user.id).pluck(:carabineros_id)
    # @idf = Uf.where(user_id: current_user.id).pluck(:fiscals_id)
    @comuna_dic = {}
    @region = Region.all
    @region.each do |region|
      @comuna_dic[region.region] = Comuna.where(region_id: region.id).map{|c| c.comuna}
    end
    gon.comuna_dic = @comuna_dic
  end

  # GET /crimes/1/edit
  def edit
  end

  # POST /crimes
  # POST /crimes.json
  def create

    @comuna_dic = {}
    @region = Region.all
    @region.each do |region|
      @comuna_dic[region.region] = Comuna.where(region_id: region.id).map{|c| c.comuna}
    end

    @crime = Crime.new(crime_params)
    @crime.estado = "Borrador"
    puts(@crime.carabineros_id)
    puts(@crime.fiscals_id)
    # puts(@comuna_dic[@crime.region])  Todas las comunas
    @crime.comuna = @comuna_dic[@crime.region][@crime.comuna.to_i]
    respond_to do |format|
      if @crime.save
        format.html { redirect_to @crime, notice: 'Procedimiento creado con éxito.' }
        format.json { render :show, status: :created, location: @crime }
      else
        format.html { render :new }
        format.json { render json: @crime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crimes/1
  # PATCH/PUT /crimes/1.json
  def update
    respond_to do |format|
      if @crime.update(crime_params)
        format.html { redirect_to @crime, notice: 'Procedimiento actualizado con éxito.' }
        format.json { render :show, status: :ok, location: @crime }
      else
        format.html { render :edit }
        format.json { render json: @crime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crimes/1
  # DELETE /crimes/1.json
  def destroy
    CrimeThief.where(crime_id:@crime.id).each do |ct|
      ct.destroy
    end
    CrimeVictim.where(crime_id:@crime.id).each do |ct|
      ct.destroy
    end
    CrimeWitness.where(crime_id:@crime.id).each do |ct|
      ct.destroy
    end
    @crime.destroy
    respond_to do |format|
      format.html { redirect_to crimes_url, notice: 'Procedimiento eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_crime
    @crime = Crime.find(params[:id])
  end

    def crime_params
      params.fetch(:crime, {}).permit(:title,:labels,:place,:description, :fecha, :comuna, :region, :fcargo, :ccargo ,:clip,:carabineros_id, :fiscals_id,  images:[], files:[])
    end
    def message_params
      params.require(:message).permit(:content, :user_id, :crime_id)
    end
end
