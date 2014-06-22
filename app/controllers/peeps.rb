get '/peeps/new' do
  erb :"peeps/new"	
end

post '/peeps' do
  message = params[:message]
  maker_id = params[:maker_id]
  Peep.create(message: message, maker_id: maker_id)
  redirect to '/'
end