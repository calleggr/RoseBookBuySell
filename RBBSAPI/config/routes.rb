RBBSAPI::Application.routes.draw do
  post '/user/create' => 'user#create'
  get '/user/find_id/:id' => 'user#find_id'
  post '/user/find_email/' => 'user#find_email'
  post '/user/find_username/' => 'user#find_username'
  post '/user/login' => 'user#login'
  
end
