class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # New Form
  get '/recipes/new' do
    erb :new
  end

  # Index Action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # Show page
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # Edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    # binding.pry
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  #   # Delete action
  #   delete '/recipes/:id' do
  #     @recipe = Recipe.find_by_id(params[:id])
  #     binding.pry
  #     @recipe.delete
  #     redirect to '/recipes'
  #   end

  delete '/recipes/:id' do
    #destroy action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
end # end of Class
