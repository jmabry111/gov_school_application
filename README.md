# General

# Set up
````bash
rake db:create
rake db:migrate
rake db:test:prepare

rails s

````

# Running Tests
Run can run all the tests in the suite with:
````bash
rake
````
or run just the ingtegration tests with:
````bash
rspec spec/integration
````

or a single test:
````bash
rspec spec/integration/application_spec.rb
````

# Update single attribute from console..
  
````set t to desired TeacherRecommendation
````t.email="desired_email"
````t.update_attribute('email',t.email)