class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
    @comment.user_id = current_user.id
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      redirect_to topics_path, danger: 'コメントの登録に失敗しました'
    end 
  end
  
    private
    def comment_params
      params.require(:comment).permit(:user_id, :topic_id, :body)
    end 
   
end
