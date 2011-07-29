# To change this template, choose Tools | Templates
# and open the template in the editor.

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  before(:each) do
    @users_controller = UsersController.new
  end

  it "should get index" do
    user = Factory(:user)
    get :index
    response.should render_template(:index)
  end

  it "should get show" do
    user = Factory(:user)
    get :show, :id => user.id
    response.should render_template(:show)
  end

  it "should get new" do
    user = Factory(:user)
    get :new
    response.should render_template(:new)
  end

  it "should get edit" do
    user = Factory(:user)
    get :edit, :id => user.id
    response.should render_template(:edit)
  end

  it "should post create" do
    user = {:name => "test", :email=>"test@test.com", :avatar => File.new("#{Rails.root}/public/images/rails.png")}
    post :create, :user => user
    assigns(:user).name.should == user[:name]
    response.should redirect_to("#{users_url}/#{assigns(:user).id}")
  end

  it "should put update" do
    user = Factory(:user)
    put :update, :id => user.id 
    response.should redirect_to("#{users_url}/#{assigns(:user).id}")
  end

  it "should delete destroy" do
    user = Factory(:user)
    delete :destroy, :id => user.id
    response.should redirect_to("#{users_url}")
  end

end

