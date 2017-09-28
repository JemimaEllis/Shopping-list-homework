class PostController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end


  set :root, File.join(File.dirname(_FILE_), "..")

  set :views, Proc.new { File.join(root, 'views')}

  $list = [{
    title: "Item 1",
    body: "2 Banana's"
  },

  {
    title: "Item 2",
    body: "1 flapjack"
   },

  {
    title: "Item 3",
    body: "4 oranges"
  }]


  get '/list' do
      @page_header = "My shopping list"
      @list = $list
  end

  get '/list' do
        @page_header = "My shopping list"
        @list = $list
        erb :"posts/index"
  end

  get'/list/new' do
    erb :"posts/new"
  end

  get 'list/:id' do
      id = params[:id].to_i
      @page_header = "list #{id}"
      @list = $list[id]
      erb :"posts/show"
  end



  post "/list" do
    new_list = {
      title: params[:title],
      body: params[:body]
    }
    $list << new_list
    redirect '/list'
  end

  	
  get "/list/:id/edit" do
    @id = params[:id].to_i
    @list = $list[@id]

    erb :"list/edit"
  end


  put "/list/:id" do

    id = params[:id].to_i

    $list[id][:title] = params[:title]
    $list[id][:body] = params[:body]
    	
    redirect "/list/#{id}"
  end

  delete 'list/:id' do
    id = params[:id].to_i
    $list.delete_at(id)
    redirect '/list'
  end
  		

  	

  	# delete '/posts/:id' do
  	# 	id= params[:id].to_i
  	# 	$posts.delete_at(id)
  	# 	redirect '/posts'
  	# end


end