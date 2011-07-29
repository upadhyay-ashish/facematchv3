# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PlayController do
  
  it "should select 4 users and also select 1 out of them for showing his/her pic" do
    user1 = Factory(:user, :name => "rails1", :email => "rails1@test.com")
    user1.avatar = File.new "#{Rails.root}/public/images/rails.png"
    user1.save

    user2 = Factory(:user, :name => "rails2", :email => "rails2@test.com")
    user2.avatar = File.new "#{Rails.root}/public/images/rails.png"
    user2.save

    user3 = Factory(:user, :name => "rails3", :email => "rails3@test.com")
    user3.avatar = File.new "#{Rails.root}/public/images/rails.png"
    user3.save

    user4 = Factory(:user, :name => "rails4", :email => "rails4@test.com")
    user4.avatar = File.new "#{Rails.root}/public/images/rails.png"
    user4.save

    selected_users = User.selected_users
    selected_users.size.should == 4
    selected_user = User.pic_user(selected_users)
    selected_user.id.should_not == nil
  end


  it "should check whether answer is correct or not" do
    user1 = Factory(:user, :name => "rails1", :email => "rails1@test.com")
    user1.avatar = File.new "#{Rails.root}/public/images/rails.png"
    user1.save

    user2 = Factory(:user, :name => "rails2", :email => "rails2@test.com")
    user2.avatar = File.new "#{Rails.root}/public/images/rails.png"
    user2.save

    user3 = Factory(:user, :name => "rails3", :email => "rails3@test.com")
    user3.avatar = File.new "#{Rails.root}/public/images/rails.png"
    user3.save

    user4 = Factory(:user, :name => "rails4", :email => "rails4@test.com")
    user4.avatar = File.new "#{Rails.root}/public/images/rails.png"
    user4.save

    selected_users = User.selected_users
    selected_users.size.should == 4
    selected_user = User.pic_user(selected_users)
    pic_user = selected_user
    pic_user.id.should == selected_user.id
  end
end

