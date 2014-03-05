task :create_ellis_package => :environment do
  
  Customer.delete_all
  CoursePackage.delete_all
  ItemGroup.delete_all
  Item.delete_all

  customer = Customer.create(:short_name => "Idapted Ellis",:company_name => "Idapted Ellis",:payment_terms => "23",:billing_currency => "yuan")

  package = customer.course_packages.create(:name => "All Ellis Lesson",:valid_for => 10,:description => "Just test",:number_of_users => 10)

  i_groups = {99 => "Speakeng99", 101 => "Speakeng101", 102 => "Speakeng102", 201 => "Speakeng201", 301 => "Speakeng301", 302 => "Speakeng302" , 303 => "Speakeng303"}

  i_groups.each do |key,value|
    package.item_groups.create(:name => value,:position => key, :credits => 10)
  end
  
  u_id = {}

  u_id[1] = 99
  u_id[2] = 99
  u_id[3] = 101
  u_id[4] = 101
  u_id[5] = 101
  u_id[6] = 101
  u_id[7] = 102
  u_id[8] = 102
  u_id[9] = 102
  u_id[10] = 102
  u_id[11] = 201
  u_id[12] = 201
  u_id[13] = 201
  u_id[14] = 201
  u_id[15] = 201
  u_id[16] = 301
  u_id[17] = 301
  u_id[18] = 301
  u_id[19] = 301
  u_id[20] = 302
  u_id[21] = 302
  u_id[22] = 302
  u_id[23] = 302
  u_id[24] = 303
  u_id[25] = 303
  u_id[26] = 303
  u_id[27] = 303
  


  Lesson.all(:order => "unit_id,id").each_with_index do |lesson,index|
    position = u_id[lesson.unit_id]
    i_group = ItemGroup.find_by_position(position)
    puts "Unit : #{lesson.unit_id} -- Position : #{position}"
    puts "Lesson : #{lesson.id} - #{lesson.name}"
    unless i_group.blank?
      i_group.items.create(:name=> lesson.name,:lesson_id => lesson.id,:position => index)
    end
  end


end