class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    erb :index
  end
  
  get '/recipes/:id' do

  end
  
  get '/recipes/:id/edit' do

  end
  
  get '/recipes/new' do

  end
  
  post '/recipes' do

  end
  
  put '/recipes/:id' do

  end
  
  delete '/recipes/:id' do

  end  

end
