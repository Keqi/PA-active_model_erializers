class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, each_serializer: UserSerializer, meta: { total: @users.count, whatever: "czesc" }, meta_key: "key1"
  end

  def show
    @user = User.find(params[:id])
    render json: @user, root: false
  end
end
