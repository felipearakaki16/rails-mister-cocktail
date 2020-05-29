class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  # GET /cocktails
  def index
    @cocktails = Cocktail.all
  end

  # GET /cocktails/1
  def show
    # ingreditents
    # doses adicionar e ver id form
    @dose = Dose.new
   end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # POST /cocktails
  def create
    @cocktail = Cocktail.new(cocktail_params)
    # @dose = Dose.new(dose_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: 'Cocktail successfully created.'
    else
      render 'new'
    end
  end

    # GET /cocktails/1/edit
  # def edit
  # end
  
  # PATCH/PUT /cocktails/1
  # def update
  #   if @cocktail.update(cocktail_params)
  #     redirect_to @cocktail, notice: 'Cocktail successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # DELETE /cocktails/1
  # def destroy
  #   @cocktail.destroy
  #   redirect_to cocktails_url, notice: 'Cocktail successfully destroyed.'
  # end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cocktail_params
      params.require(:cocktail).permit(:name)
    end
    # def dose_params
    #   params.require(:dose).permit(:description)
    # end
end











# Review
# <h1>New review for <%= @cocktail.name %></h1>

# <%= simple_form_for [@cocktail, @review] do |f| %>

#   <%= f.input :content %>
#   <%= f.submit 'Create Review', class: 'btn btn-primary' %>

# <% end %>