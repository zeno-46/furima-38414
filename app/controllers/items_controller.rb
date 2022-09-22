class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :explanation, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end
end
