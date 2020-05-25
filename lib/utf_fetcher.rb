module UtfFetcher

  def self.format_number(number)
    number.tr! '.', ''
    number.tr! ',', '.'

    reg = %r{\((.*?)\)}
    number = number.match(reg).nil? ? number : "-#{number.match(reg)[1]}"
    number.to_f
  end

  def self.fetch(desired_items)
    response = Faraday.new.get 'https://www.santander.com.ar/ConectorPortalStore/Rendimiento'
    html = Nokogiri::HTML(response.body)

    list = []

    html.css('tr').each do |row|
      row_description = row.css('table tr td').text

      # ignore items that doesn't contain desired_items
      match = desired_items
              .select { |i| row_description.include?(i) }
              .first

      next if match.nil?

      item_entry = {
        name: match,
        value: UtfHelper.format_number(row.css('td')[3].text),
        last_day: UtfHelper.format_number(row.css('td')[4].text),
        last_30_days: UtfHelper.format_number(row.css('td')[5].text),
        last_90_days: UtfHelper.format_number(row.css('td')[6].text),
        last_12_months: UtfHelper.format_number(row.css('td')[7].text)
      }

      list << item_entry
    end

    list
  end

  def self.save_new_entries()
    desired_items = UnitTrust.all.map(&:name)

    UtfHelper.fetch(desired_items).each do |i|
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
end
