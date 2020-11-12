class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_advert, only: %i[create edit update]

  def create
    @comment = @advert.comments.create(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to user_advert_path(current_user, @comment.advert), notice: 'Comment updated.'
    else
      redirect_to user_advert_path(current_user, @comment.advert), notice: 'Comment not updated.'
    end
  end

  def destroy
    @comment.destroy
    render 'destroy', notice: 'Comment successfully deleted.'
  end

  private

  def set_advert
    @advert = Advert.find(params[:advert_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
