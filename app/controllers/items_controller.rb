class ItemsController < ApplicationController

  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
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

  def edit
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:image, :title, :detail, :category_id, :quality_id, :shipping_fee_id, :prefecture_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end

end
