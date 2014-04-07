class TopicsController < ApplicationController
  def index
  	@topics = Topic.all
  end

  def show
  	@topic = Topic.find(params[:id])
  end

  def new
  	@topic = Topic.new
  end

  def create
  	@topic = Topic.new(topic_params)
  	@topic.user = current_user
  	if @topic.save
  		flash[:notice] = "Your topic was created successfully."
  		redirect_to topics_path
  	else
  		flash[:alert] = "There was a problem saving your topic"
  		redirect_to :back	
  	end
  	
  end

  def edit
  end

  private	

  def topic_params
  	params.require(:topic).permit(:name)
  	
  end
end
