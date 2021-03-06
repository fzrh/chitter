require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'

require_relative 'models/peep'
require_relative 'models/maker'
require_relative 'models/reply'

require_relative 'data_mapper_setup'
require_relative 'helpers/application'

require_relative 'controllers/application'
require_relative 'controllers/makers'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'
require_relative 'controllers/replies'

enable :sessions
set :session_secret, 'super secret'
use Rack::Flash
set :partial_template_engine, :erb