module FciHelper

  def self.format_number(number)
    number.tr! '.', ''
    number.tr! ',', '.'

    reg = %r{\((.*?)\)}
    number = number.match(reg).nil? ? number : "-#{number.match(reg)[1]}"
    number.to_f
  end

  def self.fetch
    response = Faraday.new.get 'https://www.santander.com.ar/ConectorPortalStore/Rendimiento'
    html = Nokogiri::HTML(response.body)

    desired_items = [
      'SUPER AHORRO $ CUOTA A',
      'SUPER AHORRO PLUS CUOTA A',
      'SUPERGESTION MIX VI CUOTA A'
    ]

    list = []

    html.css('tr').each do |row|
      row_description = row.css('table tr td').text

      # ignore items that doesn't contain desired_items
      next unless desired_items.any? { |i| row_description.include?(i) }

      item_entry = {
        name: row_description.strip,
        value: FciHelper.format_number(row.css('td')[3].text),
        last_day: FciHelper.format_number(row.css('td')[4].text),
        last_30_days: FciHelper.format_number(row.css('td')[5].text),
        last_90_days: FciHelper.format_number(row.css('td')[6].text),
        last_12_months: FciHelper.format_number(row.css('td')[7].text)
      }

      list << item_entry
    end

    list
  end
end
