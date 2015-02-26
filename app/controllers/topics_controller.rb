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
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:notice]= "Topic was Created"
      redirect_to @topic
    else
      flash[:error]= "There was an error creating topic please try again"
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.destroy
      flash[:notice] = "Your topic was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting your topic, please try again."
      redirect_to @topic
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
