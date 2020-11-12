class ResponsesController < ApplicationController
  def index
    @worker_responses = Response.where user: current_user
    authorize Response
  end

  def create
    response = Response.new(response_params)
    authorize response
    response.status = 'for_approval'

    response.save!
  end

  def update
    @response = Response.find(params[:id])
    authorize @response

    @response.update(response_params)
  end

  private

  def response_params
    params.require(:response).permit(:user_id, :advert_id, :status)
  end
end
