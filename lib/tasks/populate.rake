namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'ffaker'
    
    [Journal, Article].each(&:delete_all)
    

    Journal.populate 20 do |journal|
      journal.name = Populator.words(1..3).titleize
      journal.description = Populator.words(1..3).titleize
      journal.user_id = [1, 2]
    end


    Article.populate 30 do |article|
        article.user_id = [1, 2]
        article.title = Populator.words(1..5).titleize
        article.content = Populator.sentences(2..10)
        article.created_at = 2.years.ago..Time.now
    end

  end
end