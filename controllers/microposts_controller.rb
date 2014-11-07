#(index)
get '/microposts' do 
	"Hello World!"
	@microposts = Micropost.all()
 	erb :'microposts/index'
end

#(new)
get '/microposts/new' do
	erb :'microposts/new'
end

#(show)
get '/microposts/:id' do
	@micropost = Micropost.find(params[:id])
	erb :'microposts/show'
end

#(create)
post '/microposts' do
	micropost =Micropost.new(params[:micropost])
	micropost.save
	redirect("/microposts/#{micropost.id}")
end

#(edit)
get '/microposts/:id/edit' do 
	@micropost =Micropost.find(params[:id])
	erb :'microposts/edit'
end

#(update)
put 'microposts/:id' do 
	micropost = Micropost.find(params[:id])
	micropost.update(params[:micropost])
	redirect("/microposts/#{micropost.id}")
end

#(destroy)
#delete 'microposts/:id'