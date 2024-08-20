# User domain routes
namespace :stocks do 
  namespace :sessions do
    post 'sign_in', action: 'create'
    delete '/', action: 'destroy'
  end
end
