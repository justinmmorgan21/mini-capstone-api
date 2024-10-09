# config/initializers/console.rb
ActiveRecord::Base.logger = Logger.new(STDOUT)
