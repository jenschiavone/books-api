require 'factory_bot'
require_relative '../models/nyt_list'
require 'faker'

FactoryBot.define do
  factory :nyt_list, class: NytList do
    list_name {'Hardcover Fiction'}
    books { build_list(:book, 3) }
  end

  factory :book do
    title {Faker::Book.title}
    author {Faker::Book.author}
    sequence(:rank)
  end
end