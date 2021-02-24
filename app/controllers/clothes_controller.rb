class ClothesController < ApplicationController
  def index
    @clothes = Clothe.search_by_name_and_reference(params[:query])
  end

  def show
    @clothe = Clothe.find(params[:id])
    @season = Season.find(params[:season_id])
  end

  def new
    @clothe = Clothe.new
    @season = Season.find(params[:season_id])
  end

  def create
    @clothe = Clothe.new(cloth_params)
    if @clothe.save
      redirect_to season_clothe_path(@clothe.season, @clothe)
    else
      render "new"
    end
  end

  private

  def cloth_params
    params.require(:clothe).permit(:factory_id, :season_id, :pattern_id, :name, :reference, :quantity, :confection_cost, :total_cost, :selling_price)
  end
end