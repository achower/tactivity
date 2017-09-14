class TacsController < ApplicationController
  before_action :set_tac, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @tacs = Tac.all
  end

  def show
  end

  def new
    @tac = current_user.tacs.build
  end

  def edit
  end

  def create
    @tac = current_user.tacs.build(tac_params)

    if @tac.save
      redirect_to @tac, notice: 'Tac was successfully created.'
    else
      render :new 
    end
  end

  def update
    if @tac.update(tac_params)
      redirect_to @tac, notice: 'Tac was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @tac.destroy
    redirect_to tacs_url, notice: 'Tac was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tac
      @tac = Tac.find(params[:id])
    end

    def correct_user
      @tac = current_user.tacs.find_by(params[:id])
      redirect_to tacs_path, notice: "Not authorized to manage this tac" if @tac.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tac_params
      params.require(:tac).permit(:description)
    end
end
