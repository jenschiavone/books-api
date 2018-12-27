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
end

When("I make a request for hardcover fiction books") do
  @books = HTTParty.get("http://localhost:3000/?genre=hardcover-fiction")
end

Then("I should see a list of hardcover fiction books") do
  expect(@books.count).to eql @nyt_response.books.count
end