require 'spec_helper'

describe SessionCreditsController do
  before(:each) do
    @cp = Factory(:course_package,:name => "Speakeng Course")
  end
  
  it "should render new page" do
    get :new, :course_package_id => @cp.id
    response.should render_template("new")
  end
  
  it "should create new session_credit" do
    post :create,  :session_credit => {:course_package_id => @cp.id,:session_type => "1to1"}
    response.should redirect_to course_package_path(@cp,:item => "session_credits")
    flash[:notice].should == "Success"
  end
    
  it "should delete the item_group from course package" do
    i_g = Factory(:session_credit,:course_package => @cp)
    delete  :destroy, {:id => i_g.id,:course_package_id => @cp.id}
    response.should redirect_to course_package_path(@cp,:item => "session_credits")
    flash[:notice].should == "Success"
  end  

end
