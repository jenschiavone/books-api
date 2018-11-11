class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  def index
    @books = Book.all
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
