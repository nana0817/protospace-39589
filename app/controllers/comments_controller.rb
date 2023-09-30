class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
    end
  end

  private

  def comment_params
    prototype_id = params[:prototype_id]
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: prototype_id)
  end
end
