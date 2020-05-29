class DosesController < ApplicationController
  # before_action :set_dose, only: [ ]

  # GET /doses
  # def index
  #   @doses = Dose.all
  # end

  # GET /doses/1
  # def show
  # end

  # # GET /doses/new
  # def new
  # # #   cocktail = Cocktail.new
  # # #   ingredient = Ingredient.new
  # # #   @dose = Dose.new({ cocktail_id: cocktail.id, ingredient_id: ingredient.id })
  # # # NAO PRECISA DE METODO NEW PQ NAO SERA CRIADA UMA VIEW PARA ISSO
  #   @dose = Dose.new
  # end

  # POST /doses
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      # redirect_to @dose, notice: 'Dose successfully created.'
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

    # GET /doses/1/edit
  # def edit
  # end
  
  # # PATCH/PUT /doses/1
  # def update
  #   if @dose.update(dose_params)
  #     redirect_to @dose, notice: 'dose successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /doses/1
  def destroy
    # @dose = Dose.find(dose_params)
    # @dose.destroy
    # # redirect_to cocktails_url, notice: 'Dose successfully destroyed.'
    # redirect_to cocktail_path(@dose.cocktail)
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_dose
    #   @dose = dose.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end

end


