class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit ]

  # GET /doses
  def index
    @doses = Dose.all
  end

  # GET /doses/1
  def show
  end

  # GET /doses/new
  def new
    @dose = Dose.new
  end

  # POST /doses
  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to @dose, notice: 'Dose successfully created.'
    else
      render :new
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
    @dose.destroy
    redirect_to doses_url, notice: 'Dose successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = dose.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dose_params
      params.require(:dose).permit(:description)
    end

end


