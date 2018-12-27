require 'wiremock_mapper'

class NytResponse

  WireMockMapper::Configuration.set_wiremock_url(MOCK_BASE_URI)

  attr_accessor :books, :list_name

  def response
    {
        status: "OK",
        copyright: "Copyright (c) 2018 The New York Times Company.  All Rights Reserved.",
        num_results: 15,
        last_modified: "2018-12-26T23:38:02-05:00",
        results: {
            list_name: list_name,
        list_name_encoded: list_name_encoded,
        bestsellers_date: "2018-12-22",
        published_date: "2019-01-06",
        published_date_description: "latest",
        next_published_date: "",
        previous_published_date: "2018-12-30",
        display_name: "Hardcover Fiction",
        normal_list_ends_at: 15,
        updated: "WEEKLY",
        books: books.map { |book| book.to_hash},
        corrections: []
    }
    }
  end

  def list_name_encoded
    list_name.downcase.gsub(' ', '-')
  end

  def endpoint
    "/svc/books/v3/lists/hardcover-fiction.json"
  end

  #overriding ActiveRecord save! because FactoryBot calls it when you call create
  def save!
    WireMockMapper.create_mapping do |request,respond|
      request.with_url_path.equal_to(endpoint)
      # request.with_query_param('api-key').matching(/\w{32}/)
      respond.with_body(self.response)
      respond.with_header('Content-Type', 'application/json')
    end
  end

end

