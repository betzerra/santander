class UtfController < ApplicationController
  def all
    @last_update = UnitTrustEntry.last.date

    # Getting latest values for each Unit Trust
    latest_ids = UnitTrustEntry.group(:unit_trust_id).maximum(:id).values
    @list = UnitTrustEntry.where(id: latest_ids)

    # Getting a list for all Unit Trusts
    last_week = UnitTrustEntry
                .where('date BETWEEN ? AND ?', Date.today - 15, Date.today)
                .order(date: :desc)
                .group(:date, :unit_trust_id)
                .reverse

    @graph_data = []
    UnitTrust.all.each do |e|
      item = { name: e.name }

      values = last_week.select { |i| i.unit_trust_id == e.id }
      item[:values] = values.map(&:last_day)
      item[:dates] = values.map(&:date)
      item[:color] = e.color

      @graph_data << item
    end
  end

  def detail
    @unit_trust = UnitTrust.find(params[:id])
    @list = UnitTrustEntry.where(unit_trust_id: params[:id]).order(date: :desc)
    @graph_data = @list.reverse
  end
end
