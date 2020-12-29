require 'rails_helper'
describe 'Task model function', type: :model do
  describe "Validation test" do
      it "validation doesn't pass if title is empty" do
        task = Task.new(task_name: '', task_detail: 'Failure test')
        expect(task).not_to be_valid
      end

      it "validation doesn't pass if content is empty" do
        task = Task.new(task_name: 'test', task_detail: '')
        expect(task).not_to be_valid
      end
    end

      it "Validation passes if title & content are given" do
        task = Task.new(task_name: 'test', task_detail: 'check point')
        expect(task).to be_valid
      end

  end
