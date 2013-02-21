class BoardsController < ApplicationController
  def show
    @board = Board.find(params[:id])
    @topics = @board.topics.page(params[:page])
  end
end
