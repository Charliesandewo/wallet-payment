# README

Ruby 3.3.3
Rails 6.1.7.8
psql 14.13

### Initializing the database
```ruby
rails db:seed
```

the command will create the database and populate each entity (::User, ::Stock, ::Team) with 1 account with this crendetial
```
username: charliesandewo
password: password123
```

Top level design spec is available in https://drive.google.com/file/d/1A9p-u_LwoUDSazw1BWqhQzktqPgDwJ7v/view?usp=sharing

The postman requests collections are available in https://drive.google.com/drive/folders/1FalcqKPwifi025qqZecDY_vMN2FrMIIs?usp=drive_link

### Running the app
execute
```
rails server
```

the app will be served in port 3000 and accessible via localhost:3000,

requests from the postman imports can be executed