class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only:[:edit]
  before_action :set_item, only:[:show, :edit, :update]
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
  end

  def edit
  end

  def update
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
  
  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end
end
