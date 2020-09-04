class CommentsController < ApplicationController
  
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to topics_path
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました'
      redirect_to topics_path
    end 
  end
  
    private
    def comment_params
      params.require(:comment).permit(:body).merge(topic_id: params[:topic_id])
    end 
   
end
