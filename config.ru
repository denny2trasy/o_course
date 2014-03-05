# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

if Rails.env.production?
  map '/el_course' do
    run ElCourse::Application
  end
else
  run ElCourse::Application
end
