module BestsellerService
  def self.get_bestseller_list
    api_key = ENV['NYT_API_KEY']
    response = HTTParty.get("https://api.nytimes.com/svc/books/v3/lists/hardcover-fiction.json?api-key=#{api_key}")
  end
end
