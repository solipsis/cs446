require 'sqlite3'
require 'sinatra'
require 'data_mapper'
require_relative 'book'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/books.sqlite3.db")

get '/' do
  erb :form
end

post '/list' do
  sortby = params[:sort]
  @books = Book.all
  @books = @books.sort_by { |x| x[:"#{sortby}"]}
  erb :list

end

