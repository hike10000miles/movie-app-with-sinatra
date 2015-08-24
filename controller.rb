require 'sinatra'
require_relative 'models/movie'

# Create route to show all movies
get "/" do
  @movies = Movie.all
  erb :index
end
# Create route to show form for a new movie
get "/new" do
  erb :new
end
# Create route to create a new movie when form is submitted
post "/creat" do
  Movie.create(params)
  redirect "/"
end
# Create route to show one specific movie by ID
get "/movies/:id" do
  @movie = Movie.find(params[:id].to_i)
  erb :show
end
# Create route to show form to edit one specific movie
get "/movies/:id/edit" do
  @movie = Movie.find(params[:id].to_i)
  erb :edit
end
# Create route to update movie when edit form is submitted
patch "/movies/:id" do
  @movie = Movie.find(params[:id].to_i)
   @movie.update ({
      title: params[:title],
      director: params[:director],
      rating: params[:rating]
  })
  redirect "/"
end
# Create route to delete a movie 
delete "/movies/:id" do
  @movie = Movie.find(params[:id].to_i)
  @movie.destroy
  redirect "/"
end


