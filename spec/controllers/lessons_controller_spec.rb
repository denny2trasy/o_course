require 'spec_helper'

describe LessonsController do
  before(:each) do
    @course_package = Factory(:course_package)
    @item_group = Factory(:item_group,:course_package => @course_package)
  end
  
  it "should render index page" do
    get :index, :item_group_id => @item_group.id
    response.should render_template("index")
  end
  
  it "should render new page with all the lessons" do
    get :new, :item_group_id => @item_group.id, :name => "what"
    response.should render_template("new")
  end

end
