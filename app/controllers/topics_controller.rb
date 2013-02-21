class TopicsController < ApplicationController
  before_filter :increment_view_count, :only => :show

  def show
    @board = Board.find(params[:id])
    @topic = @board.topics.find(params[:id])
  end

  def create
    @board = Board.find(params[:id])
    @topic = current_user.topics.build(params[:topic])
    @topic.board_id = @board.id
  end

private

  def increment_view_count
    @board = Board.find(params[:id])
    @topic = @board.topics.find(params[:id])
    @topic.increment!(:views)
  end
end
