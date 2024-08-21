# User domain routes
namespace :stocks do 
  get 'price_all', action: 'price_all'
  get 'search', action: 'search'
  draw('/stocks/sessions_routes')
  draw ('stocks/wallets_routes')
end
