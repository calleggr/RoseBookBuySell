RBBSAPI::Application.routes.draw do
  post '/user/create' => 'user#create'
  get '/user/find_id/:id' => 'user#find_id'
  post '/user/find_email/' => 'user#find_email'
  post '/user/find_username/' => 'user#find_username'
  post '/user/login' => 'user#login'

  post '/listing/create' => 'listing#create'
  get '/listing/find_id/:id' => 'listing#find_id'
  get '/listing/find_user_id/:user_id' => 'listing#find_user_id'
  get '/listing/find_all/:user_id' => 'listing#find_all'
  post '/listing/update/' => 'listing#update'

  post '/offer/create' => 'offer#create'
  get '/offer/find_id/:id' => 'offer#find_id'
  get '/offer/find_listing_id/:listing_id' => 'offer#find_listing_id'
  post '/offer/respond_to_offer' => 'offer#respond_to_offer'
  
end
