require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do
        visit new_task_path
        fill_in 'Task name', with: "practice"
        fill_in 'Task detail', with: "manyo task"
          fill_in 'Expiration date', with: "18/01/2021"
              select 'High'
                select 'Started'
        click_button 'Create Task'
        expect(page).to have_content 'Task was successfully created.'
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        visit new_task_path
        fill_in 'Task name', with: "practice"
        fill_in 'Task detail', with: "manyo task"
          fill_in 'Expiration date', with: "18/01/2021"
              select 'High'
                select 'Started'
        click_button 'Create Task'
        visit tasks_path
        expect(page).to have_content 'practice'
        expect(page).to have_content 'manyo task'
      end
    end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do
         visit new_task_path
         fill_in 'Task name', with: "practice"
         fill_in 'Task detail', with: "manyo task"
           fill_in 'Expiration date', with: "18/01/2021"
               select 'High'
                 select 'Started'
         click_button 'Create Task'
         visit tasks_path
         expect(page).to have_content 'manyo task'
       end
     end
  end
    context 'When tasks are arranged in descending order of creation date and time' do
      it 'New task is displayed at the top' do
        visit tasks_path
        assert Task.all.order(created_at: "DESC")
      end
    end
    describe 'Search function' do

        context 'When you search by title' do
          it "Filter by tasks that include search keywords" do
            visit new_task_path
            fill_in 'Task name', with: "practice"
            fill_in 'Task detail', with: "manyo task"
              fill_in 'Expiration date', with: "18/01/2021"
                  select 'High'
                    select 'Started'
            click_button 'Create Task'
            visit tasks_path
            fill_in 'title', with: 'practice'
            click_on 'search'
            expect(page).to have_content 'practice'
          end
        end
        context 'When you search by status' do
          it "Tasks that exactly match the status are narrowed down" do
            visit new_task_path
            fill_in 'Task name', with: "practice"
            fill_in 'Task detail', with: "manyo task"
              fill_in 'Expiration date', with: "18/01/2021"
                  select 'High'
                    select 'Started'
            click_button 'Create Task'
            visit tasks_path
            fill_in 'Status', with: 'Started'
            click_on 'search'
            expect(page).to have_content 'Started'
          end
        end
        context 'When you search by title and status' do
          it "Tasks that include the search keyword in the title and exactly match the status are narrowed down" do
            visit new_task_path
            fill_in 'Task name', with: "practice"
            fill_in 'Task detail', with: "manyo task"
              fill_in 'Expiration date', with: "18/01/2021"
                  select 'High'
                    select 'Started'
            click_button 'Create Task'
              visit tasks_path
            fill_in 'title', with: 'practice'
              fill_in 'Status', with: 'Started'
              click_on 'search'
              expect(page).to have_content 'practice'
              expect(page).to have_content 'Started'
          end
        end
      end
end
