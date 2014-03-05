require 'spec_helper'

describe CustomersController do
  
  describe "index action" do
    it "should render index page" do
      get :index
      response.should render_template("index")      
    end
    it "should render new page" do
      get :new
      response.should render_template("new")
    end
    it "should redirect to index page after create customer success" do
      post  :create,  :customer => {:short_name => "Customer 1",:company_name => "Eleutian Ltd.",:payment_terms => "2",:billing_currency => "Y"}
      response.should be_redirect
      flash[:notice].should == "Success"
    end
    it "should delete the customer and redirect" do
      customer = Factory(:customer,:short_name=>"Test Eleutian")
      delete  :destroy, {:id =>  customer.id}
      response.should redirect_to customers_path
    end

  end

end
