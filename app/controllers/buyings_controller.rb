class BuyingsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.buy(post)
    flash[:success] = 'カートに入れました。'
    redirect_to post
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unbuy(post)
    flash[:success] = 'カートから削除しました。'
    redirect_to post
  end
  
  def update
    
    @buying = Buying.where(status: nil)
    time = Time.new
    @buying.update( status: "購入済み", updated_at: time)
    flash[:success] = '購入しました。'
    redirect_to root_url 
  end  
end
