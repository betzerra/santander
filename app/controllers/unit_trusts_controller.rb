class UnitTrustsController < ApplicationController
  before_action :set_unit_trust, only: [:show, :edit, :update, :destroy]

  # GET /unit_trusts
  # GET /unit_trusts.json
  def index
    @unit_trusts = UnitTrust.all
  end

  # GET /unit_trusts/1
  # GET /unit_trusts/1.json
  def show
  end

  # GET /unit_trusts/new
  def new
    @unit_trust = UnitTrust.new
  end

  # GET /unit_trusts/1/edit
  def edit
  end

  # POST /unit_trusts
  # POST /unit_trusts.json
  def create
    @unit_trust = UnitTrust.new(unit_trust_params)

    respond_to do |format|
      if @unit_trust.save
        format.html { redirect_to @unit_trust, notice: 'Unit trust was successfully created.' }
        format.json { render :show, status: :created, location: @unit_trust }
      else
        format.html { render :new }
        format.json { render json: @unit_trust.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_trusts/1
  # PATCH/PUT /unit_trusts/1.json
  def update
    respond_to do |format|
      if @unit_trust.update(unit_trust_params)
        format.html { redirect_to @unit_trust, notice: 'Unit trust was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit_trust }
      else
        format.html { render :edit }
        format.json { render json: @unit_trust.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_trusts/1
  # DELETE /unit_trusts/1.json
  def destroy
    @unit_trust.destroy
    respond_to do |format|
      format.html { redirect_to unit_trusts_url, notice: 'Unit trust was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_trust
      @unit_trust = UnitTrust.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unit_trust_params
      params.require(:unit_trust).permit(:name, :description, :deposit_time)
    end
end
