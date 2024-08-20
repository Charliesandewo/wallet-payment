# User domain routes
namespace :users do 
  namespace :sessions do
    post 'sign_in', action: 'create'
    delete '/', action: 'destroy'
  end
end
