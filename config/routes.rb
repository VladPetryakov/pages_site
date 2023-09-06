Rails.application.routes.draw do
  get '/', to: 'pages#index'
  get '/*url/edit', to: 'pages#edit', constraints: ->(request) { request_has_method(request, ['edit']) }
  put '/*url/edit', to: 'pages#update', constraints: { url: /.*/ }
  get '/*url/add', to: 'pages#add', constraints: ->(request) { request_has_method(request, ['add']) }
  post '/*url/add', to: 'pages#create', constraints: { url: /.*/ }
  get '/add', to: 'pages#add', constraints: ->(request) { request_has_method(request, ['add']) }
  post '/add', to: 'pages#create', constraints: { url: /.*/ }
  get '/*url', to: 'pages#show', constraints: ->(request) { !request_has_method(request, %w[edit add]) }
end

# Checks if the request has a method from the method_names list
def request_has_method(request, method_names)
  method_names.include?(request.url.gsub(%r{/$}, '').split('/').last)
end
