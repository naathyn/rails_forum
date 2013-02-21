class TopicsController < ApplicationController
  def show
    @board = Board.find(params[:id])
    @topic = @board.topics.find(params[:id])
  end

  def create
    @board = Board.find(params[:id])
    @topic = current_user.topics.build(params[:topic])
    @topic.board_id = @board.id
  end
end
