class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    erb :index
  end

  get '/recipes/new' do
    @recipe = Recipe.new
    erb :new
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do

  end
  
 
  
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect '/recipes/#{@recipe.id}'
  end
  
  put '/recipes/:id' do

  end
  
  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
    redirect '/recipes'
  end  

end
