###Author###

#(index)
get '/authors' do
	@authors = Author.all
	erb :'authors/index'
end

# #(show)
# get '/authors/:id'

#(new)
get '/authors/new' do 
	erb :'authors/new'
end
# #(create)
 post '/authors' do 
 	@author = Author.new(params[:author])
 	@author.save
 	redirect("/authors")
 end

# #(delete)
# delete '/authors/:id'