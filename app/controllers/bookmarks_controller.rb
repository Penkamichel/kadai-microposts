class BookmarksController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    user = current_user
    @micropost = Micropost.find(params[:micropost_id])
    user.bookmark(@micropost)
    flash[:success] = 'お気に入りしました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    user = current_user
    @micropost = Micropost.find(params[:micropost_id])
    user.unbookmark(@micropost)
    flash[:success] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
