class AdvertsController < ApplicationController
  before_action :set_advert, only: %i[show edit update destroy]

  def index
    @client_adverts = Advert.where user: current_user
    authorize Advert
  end

  def show
    @comment = Comment.new advert: @advert
  end

  def new
    @advert = Advert.new
    authorize @advert
  end

  def create
    @advert = Advert.create(advert_params)
    authorize @advert
    @advert.user_id = params[:user_id]

    if @advert.save
      redirect_to user_advert_path(current_user, @advert),
                  notice: 'Advert was successfully saved.'
    else
      render 'new'
    end
  end

  def edit
    authorize @advert
  end

  def update
    authorize @advert

    if @advert.update(advert_params)
      redirect_to user_advert_path(current_user, @advert),
                  notice: 'Advert was successfully updated.'
    else
      render 'edit'
    end
  end

  def destroy
    authorize @advert

    @advert.destroy
    redirect_to root_path, notice: 'Advert was successfully deleted.'
  end

  private

  def set_advert
    @advert = Advert.find(params[:id])
  end

  def advert_params
    params.require(:advert).permit(:picture, :text, :user_id, :tag_list)
  end
end
