Then("this test should pass") do
  expect(true).to be_truthy
 end

Then("this test should fail") do
  expect(false).to be_truthy
end

When("I make a call to the Books API") do
  @books = HTTParty.get("http://localhost:3000/?genre=hardcover-fiction")
end

Then("I should get a successful response") do
  expect(@books).to be_success
end

Given(/^there is a list of ([^"]*) books$/) do |genre|
  @nyt_list = FactoryBot.create(:nyt_list, list_name: genre)
  # @number_of_books = @nyt_list.books.length
  # @book_titles = []
  # @book_authors = []
  # @nyt_list.books.each do |book|
  #   @book_titles << book.title
  #   @book_authors << book.author
  # end
end

When("I make a request for the list") do
  # replace hardcoded url and genre with dynamic values
  # validate additional book fields
  @books = HTTParty.get("http://localhost:3000/books/genre/#{@nyt_list.list_name_encoded}")
  # @expected_titles = []
  # @expected_authors = []
  # @books.each do |book|
  #   @expected_titles << book['title']
  #   @expected_authors << book['author']
  # end
end

Then("the api should return the list") do
  expect(@nyt_list.books.length).to eq @books.length
  expect(@nyt_list.books.collect(&:title)).to eq @books.collect {|book| book['title']}
  expect(@nyt_list.books.collect(&:author)).to eq @books.collect {|book| book['author']}
end