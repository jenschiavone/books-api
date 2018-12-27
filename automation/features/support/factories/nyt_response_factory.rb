require 'factory_bot'
require_relative '../models/nyt_response'

FactoryBot.define do
  factory :nyt_response, class: NytResponse do
    list_name {'Hardcover Fiction'}
    books { build_list(:book, 3) }
  end

  factory :book do
    title {'My Title'}
  end
end