class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
    

  def buys
    @user = User.find(params[:id])
    @buys = @user.buys #userがカートに入れたたアイテムのこと
  end
  
  
private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :postalcode, :prefecture, :address)
  end
end  