class UnitTrustEntriesController < ApplicationController
  before_action :set_unit_trust_entry, only: [:show, :edit, :update, :destroy]

  # GET /unit_trust_entries
  # GET /unit_trust_entries.json
  def index
    @unit_trust_entries = UnitTrustEntry.all
  end

  # GET /unit_trust_entries/1
  # GET /unit_trust_entries/1.json
  def show
  end

  # GET /unit_trust_entries/new
  def new
    @unit_trust_entry = UnitTrustEntry.new
  end

  # GET /unit_trust_entries/1/edit
  def edit
  end

  # POST /unit_trust_entries
  # POST /unit_trust_entries.json
  def create
    @unit_trust_entry = UnitTrustEntry.new(unit_trust_entry_params)

    respond_to do |format|
      if @unit_trust_entry.save
        format.html { redirect_to @unit_trust_entry, notice: 'Unit trust entry was successfully created.' }
        format.json { render :show, status: :created, location: @unit_trust_entry }
      else
        format.html { render :new }
        format.json { render json: @unit_trust_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_trust_entries/1
  # PATCH/PUT /unit_trust_entries/1.json
  def update
    respond_to do |format|
      if @unit_trust_entry.update(unit_trust_entry_params)
        format.html { redirect_to @unit_trust_entry, notice: 'Unit trust entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit_trust_entry }
      else
        format.html { render :edit }
        format.json { render json: @unit_trust_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_trust_entries/1
  # DELETE /unit_trust_entries/1.json
  def destroy
    @unit_trust_entry.destroy
    respond_to do |format|
      format.html { redirect_to unit_trust_entries_url, notice: 'Unit trust entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /unit_trust_entries/fetch

  def fetch
    UtfHelper.fetch.each do |i|
      unit_trust = UnitTrust.where(name: i[:name]).first
      next if unit_trust.nil?

      UnitTrustEntry.create(
        value: i[:value],
        date: Time.now,
        last_day: i[:last_day],
        last_30_days: i[:last_30_days],
        last_90_days: i[:last_90_days],
        last_12_months: i[:last_12_months],
        unit_trust_id: unit_trust.id
      )
    end

    respond_to do |format|
      format.html { redirect_to unit_trust_entries_url, notice: 'woot' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_trust_entry
      @unit_trust_entry = UnitTrustEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def unit_trust_entry_params
      params.require(:unit_trust_entry).permit(:date, :value, :last_day, :last_30_days, :last_90_days, :last_12_months, :unit_trust_id)
    end
end
