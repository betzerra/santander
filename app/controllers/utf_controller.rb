class UtfController < ApplicationController
  def all
    @last_update = UnitTrustEntry.last.date

    # Getting latest values for each Unit Trust
    latest_ids = UnitTrustEntry.group(:unit_trust_id).maximum(:id).values
    @list = UnitTrustEntry.where(id: latest_ids)
  end

  def detail
    @unit_trust = UnitTrust.find(params[:id])
    @list = UnitTrustEntry.where(unit_trust_id: params[:id]).order(date: :desc)
  end
end
