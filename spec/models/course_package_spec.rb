require 'spec_helper'

describe CoursePackage do
  
  describe "register code" do
    before  :each do 
      @cp = Factory(:course_package)
    end
    it "should generate code with 16 charactars and 3 -" do
      @cp.generate_code.size.should == 19
    end
    
    it "should generate the code for coure after created it" do
      @cp.register_code.size.should == 19
    end
  end
  
end
