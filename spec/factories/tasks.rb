FactoryBot.define do
  factory :task do
    # Please change the following contents according to the column name actually created
    task_name { 'test_title' }
    task_detail { 'test_content' }
    expiration_date { '18/01/2021' }
    priority { 3 }
    status { 'Started' }
  end
end
