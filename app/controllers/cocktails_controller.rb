class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :update, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @in_update = false
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render 'cocktails/new'
    end
  end

  def update
    @dose = Dose.new
    if params["commit"] != "Validate"
      @in_update = true
      render 'cocktails/show'
    else
      @in_update = false
      @cocktail = Cocktail.find(params[:id])
      @cocktail.update(cocktail_params)
      render 'cocktails/show'
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :img_url)
  end
end
