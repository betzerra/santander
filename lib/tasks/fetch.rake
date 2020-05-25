desc "Fetch Santander's infomation about trust funds."
task fetch: :environment do
  load 'lib/utf_fetcher.rb'

  desired_items = UnitTrust.all.map(&:name)

  UtfFetcher.fetch(desired_items).each do |i|
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
end
