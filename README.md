
#User
| colum name |  Data type|
|------------|:---------:|
| name       |    string |
| email      |    string |
| password   |    string |

#Task
| colum name |  Data type|
|------------|:---------:|
| tast_name  |    string |
| task_detail|    string |
|  duedate   |      date |

#Label
| colum name |  Data type|
|------------|:---------:|
| id         |    integer|
| name       |    string |

# Main steps for deploying to Heroku

##step1: run the command rails assets:precompile RAILS_ENV=production (to precompile the assets)

##step2: run the commands git add -A & git commit -m "init" (to commit)

##step3: run the command heroku create (Create a new application on Heroku)

##step4: run the commands heroku buildpacks:set heroku/ruby & heroku buildpacks:add --index 1 heroku/nodejs (Add Heroku buildpack)

##step5: run the command git push heroku master/current branch (Deploy to Heroku)

##step6: run the command heroku run rails db:migrate (Database migration to heroku)
