
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #CREATE
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @created_article = Article.create(params)
    redirect "/articles/#{@created_article.id}"
  end

  #READ
  get '/articles' do
    erb :index
  end

  get '/articles/:id' do
    @article_to_show = Article.find(params[:id])
    erb :show
  end

  #UPDATE
  get '/articles/:id/edit' do
    @article_to_show = Article.find(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end

  #DELETE
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect :index

  end
end
