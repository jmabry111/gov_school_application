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
````bash  
set t to desired TeacherRecommendation
t.email="desired_email"
t.update_attribute('email',t.email)
````

# Open and close system for submitting applications
Production:
````bash
heroku config:set REGISTRATION_OPEN='true' --app pgsapplication
heroku config:set REGISTRATION_OPEN='false' --app pgsapplication
````
Staging:
````bash
heroku config:set REGISTRATION_OPEN='true' --app application-staging
heroku config:set REGISTRATION_OPEN='false' --app application-staging
````
Development:
````bash
export REGISTRATION_OPEN='true'
export REGISTRATION_OPEN='false'
````
