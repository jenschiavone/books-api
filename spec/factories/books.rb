FactoryBot.define do
    factory :book do
        title { Faker::Lorem.word }
        author { Faker::StrangerThings.character }
        rank { Faker::Number.between(1, 15) }
        rank_last_week { Faker::Number.between(1, 15) }
        weeks_on_list { Faker::Number.non_zero_digit }
        amazon_product_href { Faker::Internet.url('amazon.com') }
        book_image_href { Faker::Internet.url('s1.nyt.com', 'books/images/123.jpg') }
        description { Faker::StrangerThings.quote }
        published_date { Faker::Date.between(60.days.ago, Date.today) }
    end
end
