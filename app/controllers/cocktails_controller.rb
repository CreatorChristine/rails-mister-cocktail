class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all.order(name: :asc)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params[:cocktail])
    if @cocktail.save
      redirect_to @cocktail
    else
      render 'new'
    end

  end

  private 
  
  def cocktail_params
  params.require(:cocktails).permit(:)
  end
end
