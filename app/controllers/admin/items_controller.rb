class Admin::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
  end
  
  def new
  end
  
  def create
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
end
