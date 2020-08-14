class DosesController < ApplicationController

  # /cocktails/:cocktail_id/doses(.:format)
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  # /cocktails/:cocktail_id/doses/new(.:format)
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if params[:dose][:ingredient_id] != ""
      @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
      return redirect_to cocktail_path(@cocktail) if @dose.save
    end
    render :new
  end

  def destroy
    # @cocktail = Cocktail.find(params[:id].split('/')[0].to_i)
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end
