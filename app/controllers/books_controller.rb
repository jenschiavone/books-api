class BooksController < ApplicationController
  include BestsellerService
  before_action :set_book, only: [:show]

  def index
    @books = BestsellerService.get_bestseller_list
    json_response(@books)
  end

  def show
    json_response(@book)
  end

    private
      def set_book
        @book = Book.find(params[:id])
      end
end
