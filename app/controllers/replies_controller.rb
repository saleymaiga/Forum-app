class RepliesController < ApplicationController

  def new
  	@topic = Topic.find(params[:topic_id])
  	@reply = @topic.replies.new
  end

  def create
  	@reply = Reply.new(reply_params)
  	@reply.topic_id = params[:topic_id]
  	@reply.user = current_user	
  	if @reply.save
  		flash[:notice] = "Your post was added successfully"
  		redirect_to topic_path(@reply.topic)
  	else
  		flash[:alert] = "There was a problem adding your new post"
  		redirect_to :back
  		
  	end
  end



  private


  def reply_params
  	params.require(:reply).permit(:body, :title)
  	
  end

end
