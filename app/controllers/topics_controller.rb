class TopicsController < ApplicationController
  before_filter :signed_in_user
  before_filter :record_timestamps, only: :create
  before_filter :increment_view_count!, only: :show

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

  # Currently recording timestamps on a
  # seperate callback to prevent breaking

  def record_timestamps
    Topic.record_timestamps = true
  end

  def increment_view_count!
    Topic.record_timestamps = false
    Topic.find(params[:id]).increment!(:views)
  end
end
