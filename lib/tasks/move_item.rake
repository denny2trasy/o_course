# Update item lesson table
task :update_item_lesson => :environment do  
  Item.all.each do |item|
    puts "Item : #{item.id}"
    item.update_attributes(:content_id=> item.lesson_id,:content_type=>"Lesson")
  end
end

# Clean course_package data without customer
task :clean_course_package => :environment do
  n_customers = Customer.all.map(&:id)
  c_customers = CoursePackage.all(:select=>"distinct customer_id").map(&:customer_id)
  e = c_customers - n_customers
  puts "Before CoursePackage size : #{CoursePackage.count}"
  CoursePackage.delete_all("customer_id in (#{e.join(',')})") unless e.blank?
  puts "After CoursePackage size : #{CoursePackage.count}"
end

# Scenario name, show_scenario_id and image_url 
task :update_item_scenario => :environment do
  # step 1 delete scenario without itemgroup , itemgroup=105,104
  Scenario.delete_all("item_group_id in (105,104)")
  # step 2 create item base on scenario which have item group
  puts "Before insert scenario item count : #{Item.count}"
  puts "Scenario count : #{Scenario.count}"
  Scenario.all.each do |scenario|
    i_group = ItemGroup.find_by_id(scenario.item_group_id)
    unless i_group.blank?
      i_group.update_attributes(:course_type=>"Scenario")
      item = i_group.items.new
      item.content_id = scenario.id
      item.content_type = "Scenario"
      item.name = scenario.name
      item.position = scenario.position
      item.save
    end
  end
  puts "After insert scenario item count : #{Item.count}"  
  # step 3 clean scenario with the same show_scenario_id [803,831,836,838]  
end

# Thinkingcap name , show_content_id and image_url 
task :update_item_thinkingcap => :environment do
  
  puts "Before insert thinkingcap item count : #{Item.count}"
  ThirdContent.all(:conditions=>"thinkingcap_course is not null and thinkingcap_course != ''").each do |third|
    i_group = ItemGroup.find_by_id(third.item_group_id)
    unless i_group.blank?
      i_group.update_attributes(:course_type=>"Thinkingcap")
      puts "Create Item : #{third.id} - #{third.name}"
      thinking = Thinkingcap.find_or_create_by_name_and_show_course_id(third.name,third.thinkingcap_course)
      puts " -- Thinking : #{thinking.id} - #{thinking.name}"
      item = i_group.items.new
      item.content_id = thinking.id
      item.content_type = "Thinkingcap"
      item.name = thinking.name
      item.position = third.position
      item.save
    end
  end
  puts "After insert thinkingcap item count : #{Item.count}"  
  
end

# Chinacache name, show_link
task :update_item_chinacache => :environment do
  puts "Before insert chinacache item count : #{Item.count}"
  ThirdContent.all(:conditions=>"show_link like 'http%'").each do |third|
    i_group = ItemGroup.find_by_id(third.item_group_id)
    unless i_group.blank?
      i_group.update_attributes(:course_type=>"Chinacache")
      puts "Create Item : #{third.id} - #{third.name}"
      china = Chinacache.find_or_create_by_name_and_show_chinacache_id(third.name,third.show_link)
      puts " -- Chinacache : #{china.id} - #{china.name}"
      item = i_group.items.new
      item.content_id = china.id
      item.content_type = "Chinacache"
      item.name = china.name
      item.position = third.position
      item.save
    end
  end
  puts "After insert chinacache item count : #{Item.count}"  
end

# unify item_group course_type
task :unify_item_group_course_type => :environment do
  ItemGroup.update_all("course_type='Lesson'","course_type is null or course_type='ellis'")
  ItemGroup.update_all("course_type='Scenario'","course_type='Scenario'")
  # Thinkingcap
  cond = "course_type='third_content'"
  puts "Before Thinkingcap, third_content count : #{ItemGroup.count(:conditions=>cond)}"
  ItemGroup.update_all("course_type='Thinkingcap'","course_package_id in(65,76,78,80)")
  puts "After Thinkingcap, third_content count : #{ItemGroup.count(:conditions=>cond)}"
  # Chinacache
  ItemGroup.update_all("course_type='Chinacache'","course_type='third_content'")
end
