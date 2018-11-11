module BestsellerService
  def self.get_bestseller_list
    api_key = ENV['NYT_API_KEY']
    response = HTTParty.get("https://api.nytimes.com/svc/books/v3/lists/hardcover-fiction.json?api-key=#{api_key}")
    bestsellers = []
    response['results']['books'].each do |nyt_book|
      book = Book.new
      book.title = nyt_book['title']
      book.author = nyt_book['author']
      book.rank = nyt_book['rank']
      book.rank_last_week = nyt_book['rank_last_week']
      book.weeks_on_list = nyt_book['weeks_on_list']
      book.amazon_product_href = nyt_book['amazon_product_url']
      book.book_image_href = nyt_book['book_image']
      book.description = nyt_book['description']
      bestsellers << book
    end
    return bestsellers
  end
end
