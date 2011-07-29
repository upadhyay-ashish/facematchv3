# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
   user = Factory(:user)
   user.save
  end

  it "should validate username is present" do
   person = User.where(:name => "rails")
   person[0].name.should == "rails"
  end

  it "should validate username length is less than 50" do
   person = User.where(:name => "rails")
   person[0].name.length.should <= 50
  end

  it "should validate email length is less than 50" do
   person = User.where(:name => "rails")
   person[0].email.length.should <= 50
  end

  it "should validate email is present" do
   person = User.where(:name => "rails")
   person[0].email.should == "rails@test.com"
  end

  it "should validate email format is correct" do
   person = User.where(:name => "rails")
   person[0].email.should =~ /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/
  end

  it "should validate email is unique" do
   user2 = User.create(:name => "Submit", :email => "rails@test.com")
   user2.avatar = File.new "#{Rails.root}/public/images/button_submit.jpg"
   user2.valid?.should == false
  end

  it "should validate image is present" do
   person = User.where(:name => "rails")
   person[0].avatar_file_name.should_not == nil
   person[0].avatar_content_type.should == "image/png"
  end

  it "should validate image format is correct" do
   person = User.where(:name => "rails")
   person[0].avatar_file_name.should_not == nil
   person[0].avatar_content_type.should == "image/png"
  end

  it "should validate image size is less than 2MB" do
   person = User.where(:name => "rails")
   person[0].avatar_file_name.should_not == nil
   person[0].avatar_content_type.should == "image/png"
   person[0].avatar_file_size.should < 2.megabytes
  end

  it "should validate that 4 users are selected" do
    user2 = Factory(:user, :name => "rails2", :email => "rails2@test.com")
    user2.avatar = File.new "#{Rails.root}/public/images/rails.png"
    user2.save

    user3 = Factory(:user, :name => "rails3", :email => "rails3@test.com")
    user3.avatar = File.new "#{Rails.root}/public/images/rails.png"
    user3.save

    user4 = Factory(:user, :name => "rails4", :email => "rails4@test.com")
    user4.avatar = File.new "#{Rails.root}/public/images/rails.png"
    user4.save

    users = User.selected_users
    users.size.should == 4
  end

  it "should validate one user(for displaying his/her pic) is selected out of the 4 selected users" do
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
    selected_user = User.pic_user(selected_users)
    selected_user.id.should_not == nil
  end

  it "should validate selection of 1 user" do
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
    first_user = User.first_user(selected_users)
    first_user.id.should_not == nil
  end
  
end

