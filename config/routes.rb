Rails.application.routes.draw do

  root 'books#index'
  resources :books
  get 'books/genre/:genre' => 'books#books_by_genre'

end
