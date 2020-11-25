class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  def new
    @user = User.new
  end

  def show

  end

  def edit

  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
          format.html { redirect_to root_path, notice: 'Usuario creado con éxito.' }
          format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {}).permit(:name,:region,:rut,:email,:job,:password, :password_confirmation)
  end
end
