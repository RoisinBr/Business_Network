require 'pg'
require 'active_record'


options = {
  adapter: 'postgresql',
  database: 'networking'
}

ActiveRecord::Base.establish_connection(options)






