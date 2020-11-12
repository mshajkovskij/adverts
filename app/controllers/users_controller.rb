class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
    authorize @user
  end

  def create
    User.create(user_params)

    if @user.save
      redirect_to @user, notice: "#{@user.full_name} was successfully saved."
    else
      render 'new'
    end
  end

  def edit
    authorize @user
  end

  def update
    authorize @user

    if @user.update(user_params)
      redirect_to user_path(@user), notice: "#{@user.full_name} was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    authorize @user
    @user.destroy
    warden.logout(@user)
    redirect_to users_path, notice: "#{@user.full_name} was successfully deleted."
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email,
                                 :login,
                                 :full_name,
                                 :birthday,
                                 :address,
                                 :city,
                                 :state,
                                 :country,
                                 :zip,
                                 :role)
  end
end
