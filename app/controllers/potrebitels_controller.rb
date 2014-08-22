class PotrebitelsController < ApplicationController
  before_action :set_potrebitel, only: [:show, :edit, :update, :destroy]

  # GET /potrebitels
  # GET /potrebitels.json
  def index
    @potrebitels = Potrebitel.all
  end

  # GET /potrebitels/1
  # GET /potrebitels/1.json
  def show
  end

  # GET /potrebitels/new
  def new
    @potrebitel = Potrebitel.new
  end

  # GET /potrebitels/1/edit
  def edit
  end

  # POST /potrebitels
  # POST /potrebitels.json
  def create
    @potrebitel = Potrebitel.new(potrebitel_params)

    respond_to do |format|
      if @potrebitel.save
        format.html { redirect_to @potrebitel, notice: 'Potrebitel was successfully created.' }
        format.json { render :show, status: :created, location: @potrebitel }
      else
        format.html { render :new }
        format.json { render json: @potrebitel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /potrebitels/1
  # PATCH/PUT /potrebitels/1.json
  def update
    respond_to do |format|
      if @potrebitel.update(potrebitel_params)
        format.html { redirect_to @potrebitel, notice: 'Potrebitel was successfully updated.' }
        format.json { render :show, status: :ok, location: @potrebitel }
      else
        format.html { render :edit }
        format.json { render json: @potrebitel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /potrebitels/1
  # DELETE /potrebitels/1.json
  def destroy
    @potrebitel.destroy
    respond_to do |format|
      format.html { redirect_to potrebitels_url, notice: 'Potrebitel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potrebitel
      @potrebitel = Potrebitel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def potrebitel_params
      params.require(:potrebitel).permit(:login, :password, :email, :win, :lost, :success_cat_id, :failure_cat_id, :time_online, :reiting_pos)
    end
end
