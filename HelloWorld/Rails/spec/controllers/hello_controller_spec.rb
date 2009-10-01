require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HelloController do
  integrate_views

  it "should use HelloController" do
    controller.should be_an_instance_of(HelloController)
  end

  it "should be a success" do
    response.should be_success
  end

  it "should assign greeting" do
    get :index
    assigns[:greeting].should == 'world'
  end

  it "should return hello world by default" do
    get :index
    response.should have_text('hello world')
  end

  it "should return hello x when param passed" do
    get :index, :greeting => 'chris'
    response.should have_text('hello chris')
  end
end
