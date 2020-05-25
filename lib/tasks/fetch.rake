desc "Fetch Santander's infomation about trust funds."
task fetch: :environment do
  load 'lib/utf_fetcher.rb'
  UtfFetcher.save_new_entries
end
