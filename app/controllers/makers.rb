get '/makers/signup' do
  erb :"makers/signup"
end

post '/makers' do
  maker = Maker.create(:name => params[:name], :username => params[:username], :email => params[:email], :password => params[:password])
  session[:maker_id] = maker.id
  redirect to('/')
end