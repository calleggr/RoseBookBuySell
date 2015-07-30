RBBSAPI::Application.routes.draw do
  post '/user/create' => 'user#create'
  get '/user/read:id' => 'user#read'
end
