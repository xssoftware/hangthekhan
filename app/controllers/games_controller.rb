class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :join, :make_move]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.user1 = current_user
    @game.status = 0

    respond_to do |format|
      if @game.save
        format.html { redirect_to lobby_index_url, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    if @game.user1 == current_user
      @game.destroy
      @notice = 'Game was successfully destroyed.'
    else
      @notice = 'You cannot destroy other user\'s game.'
    end

    respond_to do |format|
      format.html { redirect_to lobby_index_url, notice: @notice}
      format.json { head :no_content }
    end
  end

  def join
    if @game.user2
      @notice = 'Game cannot be accepted.'
    elsif @game.user1 == current_user
      @notice = 'Game cannot be accepted.'
    else
      @game.user2 = current_user
      @game.save
      @notice = 'Game accepted.'
    end

    respond_to do |format|
      format.html {
        redirect_to lobby_index_url, notice: @notice
      }
    end
  end

  def make_move
    @res = @game.make_move(current_user, params[:char])
    if @res == "Game over"
      @game.status = 2
      @game.save
      redirect_to lobby_index_url, notice: 'You are hung and dead!'
      return
    elsif @res == "Letter already used"
      @notice = 'Move not made. Letter already used. Try another letter.'
    elsif @res == 'Game won'
      @game.status = 1
      @game.save
      redirect_to lobby_index_url, notice: 'Congratulations. Game won!'
      return
    elsif @res
      @notice = 'Move made.'
    else
      @notice = 'Cannot make moves.'
    end

    respond_to do |format|
      format.html {
        redirect_to game_url(@game), notice: @notice
      }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:word_id)
    end
end
