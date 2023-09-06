class UsersController < ApplicationController
  def create 
@user = User.new(user_params)

if @user.save
  session[:user_id] = @user.id
  render json:{
  id:@user.id,
  username:@user.username,
  image_url: @user.image_url,
  bio:@user.bio
},status: :created
else
  render json:{error:@user.errors.full_messages.join(',')}, status: :unprocessable_entity
  end
end
