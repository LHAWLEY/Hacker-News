get '/' do
  redirect '/posts'
end

get '/posts' do
  @posts = Post.all
  erb :index
end

get '/posts/:id/vote' do
  post = Post.find(params[:id])
  if request.xhr?
    post.votes.create(value: 1)

    content_type :json
    { id: post.id, votes: post.votes.count.to_s}.to_json
  else
    redirect "/posts"
  end
end

delete '/posts/:id' do
  @post = Post.find(params[:id])
  @post.destroy

  redirect '/posts/'
end

post '/posts' do
  Post.create( title: params[:title],
               username: Faker::Internet.user_name,
               comment_count: rand(1000) )
  redirect '/posts'
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end
