class FciController < ApplicationController
  def all
    @last_update = UnitTrustEntry.last.date
    latest_ids = UnitTrustEntry.group(:unit_trust_id).maximum(:id).values
    @list = UnitTrustEntry.where(id: latest_ids)
  end

  def detail
  end
end
