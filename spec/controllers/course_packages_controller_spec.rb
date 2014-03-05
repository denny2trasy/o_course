require 'spec_helper'

describe CoursePackagesController do
  before(:each) do
    @customer = Factory(:customer)
    @cp1 = Factory(:course_package,:customer => @customer,:name => "Speakeng Course")
  end

  it "should render index page and list all the course package for customer" do
    get :index, :customer_id => @customer.id
    response.should render_template("index")    
  end

  it "should render new page" do
    get :new, :customer_id => @customer.id
    response.should render_template("new")
  end
  
  it "should create new course package for customer and redirect" do
    post  :create,  {:course_package => {:customer_id => @customer.id,:name => "EQEnglish Course"}}
    response.should redirect_to course_packages_path(:customer_id => @customer.id)
    flash[:notice].should == "Success"
  end
  
  it "should show course package detail" do
    get :show,  :customer_id => @customer.id, :id => @cp1.id
    response.should render_template("show")
  end
  
  it "should delete course package from customer" do
    delete  :destroy, {:id => @cp1.id,:customer_id => @customer.id}
    response.should redirect_to course_packages_path(:customer_id => @customer.id)
    flash[:notice].should == "Success"
  end

end
