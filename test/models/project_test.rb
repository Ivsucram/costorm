require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
  	@project = projects(:good_one)
    @user = users(:good_one)
  end

  # CRUD C
  test 'should create' do
    assert_difference('Project.count') do
      Project.create(:user_id => @user.id, :name => 'MyNameTest', :description => 'MyDescriptionTest', :project_type => 1, :is_published_flag => true, :published_date => Date.today-1)
    end 	
  end

  # CRUD R
  test 'should read' do
    assert(Project.first == @project, 'Poroject.first expected to be good_one form yaml')
    project = Project.create(:user_id => @user.id, :name => 'MyNameTest', :description => 'MyDescriptionTest', :project_type => 1, :is_published_flag => true, :published_date => Date.today-1)
    assert(Project.last == project, 'Project.last expected to be %{project}')
  end

  # CRUD U
  test 'should update' do
    project = Project.create(:user_id => @user.id, :name => 'MyNameTest', :description => 'MyDescriptionTest', :project_type => 1, :is_published_flag => true, :published_date => Date.today-1)
    assert(project.name = 'MyNameTest')
    project.name = 'MyNameTestUpdated'
    project.save
    assert(project.changed? == false, 'project was not saved')    
    assert(project.name == 'MyNameTestUpdated')
  end

  # CRUD D
  test 'should delete' do
    assert_difference('Project.count', -1) do
      Project.first.delete
    end
  end

  test 'validates user_id field' do
    #Validates presence
    project = Project.create(:name => @project.name, :description => @project.description, :project_type => @project.project_type, :is_published_flag => @project.is_published_flag, :published_date => @project.published_date)
    assert !project.save
  end
  
end