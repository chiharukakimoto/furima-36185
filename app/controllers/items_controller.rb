class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @articles = Article.order("created_at DESC")
  end
  
  def new
  end
end