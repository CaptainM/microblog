###Tags###
#(index)
 get '/tags' do 
 	@tags = Tag.all
 	erb :'tags/index'
 end

# #(show)
get '/tags/:id' do 
	@tags = Tag.find(params[:id])
	erb :'tags/show'
end

get '/tags/:id/edit' do
	@tag = Tag.find(params[:id])
	erb :'tags/edit'
end 

#(destroy)
delete '/tags/:id' do 
	@tag = Tag.find(params[:id])
	@tag.destroy
	redirect "/tags"
end
# #(add tag)
# put '/tags/:id/add_id'

# #(remove tag)
# put '/tags/:id/remove_song'