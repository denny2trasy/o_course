require 'spec_helper'

describe ItemGroupsController do
  before(:each) do
    @cp = Factory(:course_package,:name => "Speakeng Course")
  end
  
  it "should render new page" do
    get :new, :course_package_id => @cp.id
    response.should render_template("new")
  end
  
  it "should create a new item_group" do
    post  :create,  :item_group => {:course_package_id => @cp.id,:name => "Group 1",:position => 1,  :credits => 2}
    response.should redirect_to course_package_path(@cp,:item => "item_groups")
    flash[:notice].should == "Success"
  end
  
  it "should delete the item_group from course package" do
    i_g = Factory(:item_group,:course_package => @cp)
    delete  :destroy, {:id => i_g.id,:course_package_id => @cp.id}
    response.should redirect_to course_package_path(@cp,:item => "item_groups")
    flash[:notice].should == "Success"
  end

end
