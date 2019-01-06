Then("this test should pass") do
  expect(true).to be_truthy
 end

Then("this test should fail") do
  expect(false).to be_truthy
end

When("I make a call to the Books API") do
  @books = HTTParty.get("#{BOOKS_API_BASE_URL}/?genre=hardcover-fiction")
end

Then("I should get a successful response") do
  expect(@books).to be_success
end

Given(/^there is a list of ([^"]*) books$/) do |genre|
  @nyt_list = FactoryBot.create(:nyt_list, list_name: genre)
end

When("I make a request for the list") do
  @books = HTTParty.get("#{BOOKS_API_BASE_URL}/books/genre/#{@nyt_list.list_name_encoded}")
end

Then("the api should return the list") do
  expect(@nyt_list.books.length).to eq @books.length
  expect(@nyt_list.books.collect(&:title)).to eq @books.collect {|book| book['title']}
  expect(@nyt_list.books.collect(&:author)).to eq @books.collect {|book| book['author']}
end