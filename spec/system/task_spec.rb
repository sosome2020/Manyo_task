require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do
        visit new_task_path
        fill_in 'Task name', with: "practice"
        fill_in 'Task detail', with: "manyo task"
        click_button 'Create Task'
        expect(page).to have_content 'Task was successfully created.'
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        visit new_task_path
        fill_in 'Task name', with: "Use a mask"
        fill_in 'Task detail', with: "mask_up"
        click_button 'Create Task'
        visit tasks_path
        expect(page).to have_content 'Use a mask'
        expect(page).to have_content 'mask_up'
      end
    end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do
         visit new_task_path
         fill_in 'Task name', with: "Use a mask"
         fill_in 'Task detail', with: "mask_up"
         click_button 'Create Task'
         visit tasks_path
         expect(page).to have_content 'mask_up'
       end
     end
  end
end
