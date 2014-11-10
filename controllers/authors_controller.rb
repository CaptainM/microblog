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

#(edit)
get '/authors/:id/edit' do 
	@author = Author.find(params[:id])
	erb :'authors/edit'
end

put '/authors/:id' do 
	author =Author.find(params[:id])
	author.update(params[:author])
	redirect ("/authors")
end

# #(create)
 post '/authors' do 
 	@author = Author.new(params[:author])
 	@author.save
 	redirect("/authors")
 end

# #(delete)
delete '/authors/:id' do 
	@authors =Author.find(params[:id])
	@authors.destroy
	redirect"/authors" 
end