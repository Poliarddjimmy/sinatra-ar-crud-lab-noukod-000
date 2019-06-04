require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/posts'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params[:post])

    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(params[:post])
    redirect to "/posts/#{params[:id]}"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post.destroy
    redirect to '/posts'
  end
end