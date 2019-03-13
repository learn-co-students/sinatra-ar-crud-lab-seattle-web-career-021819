
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @title = params[:title]
    @content = params[:content]

    Article.create(title: @title, content: @content)
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])

    @updated_title = params[:title]
    @updated_content = params[:content]

    @article.update(title: @updated_title, content: @updated_content)
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    #@article = Article.find(params[:id])
    #erb :show
    Article.destroy(params[:id])
    redirect '/articles'
  end

end
