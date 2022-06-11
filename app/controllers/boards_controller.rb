class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to @board, notice: '投稿が作成されました'
    else
      render :new
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update    
    @board = Board.find(params[:id])
    if @board.update(board_params)
      redirect_to @board, notice: '投稿が編集されました'
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_url, notice: '投稿は削除されました'
  end

  private
  
  def board_params
    params.require(:board).permit(:title, :body)
  end

end
