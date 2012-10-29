ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
#    div :class => "blank_slate_container", :id => "dashboard_default_message" do
#      span :class => "blank_slate" do
#        span "Welcome to Active Admin. This is the default dashboard page."
#        small "To add dashboard sections, checkout 'app/admin/dashboards.rb'"
#      end
#    end
  
  columns do
    
#    column do
#      panel "Recent Applicants" do
#        table_for Applicant.order('last_name').limit(10) do
#          column("Name")    {|applicant| applicant.first_name + " " + applicant.last_name}
#          column("School")  {|applicant| applicant.school.name}
#          column("Science Recommendation Teacher")  {|applicant| applicant.science_recommendation.teacher_name}
#          column("Math Recommendation Teacher")  {|applicant| applicant.math_recommendation.teacher_name}
#          column("English Recommendation Teacher")  {|applicant| applicant.english_recommendation.teacher_name}
#        end
#      end
#    end
#  end
  
  columns do
    column do
      panel "List of Schools" do
        table_for School.order('name') do
          column("School Name") {|school| school.name}
        end
      end
    end
    
    column do
      panel "Current Users" do
        table_for User.order('id') do
          column("User Id")         {|user| user.email}
          column("Affiliated School")          {|user| user.school.name}
          column("Administrator?")  {|user| user.admin}
        end
      end
    end
  end
  
  end # content
end
