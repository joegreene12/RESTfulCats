require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adaptor => 'postgresql',
  :database => 'restfulcats'

)
