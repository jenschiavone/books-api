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

Given("there is a list of hardcover fiction books") do
  @nyt_response = FactoryBot.create(:nyt_response)
  @number_of_books = @nyt_response.books.length
  @book_titles = []
  @book_authors = []
  @nyt_response.books.each do |book|
    @book_titles << book.title
    @book_authors << book.author
  end
end

When("I make a request for hardcover fiction books") do
  # replace hardcoded url and genre with dynamic values
  # validate additional book fields
  @books = HTTParty.get("http://localhost:3000/?genre=hardcover-fiction")
  @expected_titles = []
  @expected_authors = []
  @books.each do |book|
    @expected_titles << book['title']
    @expected_authors << book['author']
  end
end

Then("I should see a list of hardcover fiction books") do
  expect(@number_of_books).to eq @books.length
  expect(@book_titles).to eq @expected_titles
  expect(@book_authors).to eq @expected_authors
end