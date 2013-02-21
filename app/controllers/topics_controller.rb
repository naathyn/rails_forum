class TopicsController < ApplicationController
  before_filter :increment_view_count, :only => :show
  before_filter :signed_in_user, :except => :show

  def show
    @board = Board.find(params[:board_id])
    @topic = @board.topics.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @board = Board.find(params[:board_id])
    @topic = current_user.topics.build(params[:topic])
    @topic.board_id = @board.id
    if @topic.save
      redirect_to topic_path([@board, :topics, @topic]), notice: "Your topic has been saved."
    else
      render :new
    end
  end

  def destroy
    @board = Board.find(params[:board_id])
    @topic = current_user.topics.find(params[:id])
    @topic.destroy
    redirect_to @board, notice: "Your topic was removed"
  end

private

  def increment_view_count
    @topic = Topic.find(params[:id])
    @topic.increment!(:views)
  end
end
