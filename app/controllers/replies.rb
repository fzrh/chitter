get '/peeps/reply' do
  @peep_id = Peep.find(params[:id])
  if @peep_id.first
  	redirect '/peeps/:id/reply'
  else
  	redirect '/'
  end
end

get '/peeps/:id/reply' do
  erb :"peeps/reply"
end

# post '/replies' do
#   message = params[:message]
#   maker_id = params[:maker_id]
#   Peep.create(message: message, maker_id: maker_id)
#   redirect to '/'
# end