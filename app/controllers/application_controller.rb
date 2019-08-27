class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
  	@recipes = Recipe.all
  	erb :index
  end

  get '/recipes/new' do
  	erb :new
  end

  post '/recipes' do
  	recipe = Recipe.create do |r|
  		r.name = params[:name]
  		r.ingredients = params[:ingredients]
  		r.cook_time = params[:cook_time]
  	end

  	redirect to("/recipes/#{recipe.id}")
  end

  get '/recipes/:id' do
  	@recipe = Recipe.find(params[:id])
  	erb :recipe
  end

  get '/recipes/:id/edit' do
  	@recipe = Recipe.find(params[:id])
  	erb :edit
  end

  patch '/recipes/:id' do
  	@recipe = Recipe.find(params[:id])
  	@recipe.update do |r|
  		r.name = params[:name]
  		r.ingredients = params[:ingredients]
  		r.cook_time = params[:cook_time]
  	end

  	redirect to("/recipes/#{params[:id]}")
  end

  delete '/recipes/:id' do
  	@recipe = Recipe.find(params[:id])
  	@recipe.destroy

  	redirect to('/recipes')
  end

end