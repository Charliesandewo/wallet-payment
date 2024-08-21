namespace :wallets do
  get '/', action: 'index'
  post 'top_up', action: 'top_up'
  post 'withdraw', action: 'withdraw'
  post 'transfer', action: 'transfer'
end