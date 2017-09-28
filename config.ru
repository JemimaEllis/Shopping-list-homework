require "sinatra"
require "sinatra/reloader" if development?

require_relative "./controllers/post_controllers.rb"

use Rack:MethodOverride

run PostController