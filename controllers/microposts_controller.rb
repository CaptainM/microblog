#(index)
get '/microposts' do 
	@microposts = Micropost.all()
	@tags = Tag.all
 	erb :'microposts/index'
end

#(new)
get '/microposts/new' do
	@author = Author.all
	@tags = Tag.all
	erb :'microposts/new'
end

#(show)
get '/microposts/:id' do
	@author = Author.all
	@micropost = Micropost.find(params[:id])
	@tags = Tag.all
	erb :'microposts/show'
end

#(create)
post '/microposts' do
	@author = Author.all
	@micropost =Micropost.new(params[:micropost])
	@micropost.save
	redirect("/microposts")
end

#(edit)
get '/microposts/:id/edit' do 
	@micropost =Micropost.find(params[:id])
	erb :'microposts/edit'
end

#(update)
put '/microposts/:id' do 
	micropost = Micropost.find(params[:id])
	micropost.update(params[:micropost])
	redirect("/microposts/#{micropost.id}")
end

#(destroy)
delete '/microposts/:id' do
	@micropost = Micropost.find(params[:id])
	@micropost.destroy
	redirect "/microposts"
end