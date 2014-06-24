get '/peeps/new' do
  erb :"peeps/new"	
end

# post '/peeps' do
#   message = params[:message]
#   maker_id = params[:maker_id]
#   Peep.create(message: message, maker_id: maker_id)
#   redirect to '/'
# end

post '/peeps' do
  @peep = Peep.new(:message => params[:message], :maker_id => params[:maker_id])
  if @peep.save
  	redirect to('/')
  else
    flash[:notice] = 'You did not peep anything'
  	erb :"peeps/new"
  end
end