class PlayController < ApplicationController
   def play_game
    reset_session
    @selected_users = User.selected_users
    @pic_user = User.pic_user(@selected_users)
    unless @pic_user == nil
    session[:pic_answer] = @pic_user.id
    session[:pic_name] = @pic_user.name
    session[:pic_url] = @pic_user.avatar.url
    end
   end

   def answer
    @selected_user = User.where(:id => "#{params[:user_id]}")
    @selected_user = User.first_user(@selected_user)
    session[:user_id] = @selected_user.id unless @selected_user == nil
   end

end



