require "fnordmetric"

FnordMetric.namespace :unbound do

	toplist_gauge :popular_users, title: "Popular Users"

	toplist_gauge :popular_articles, title: "Articles Populaires"

	toplist_gauge :popular_journals, title: "Journaux Populaires"

	gauge :user_views_per_second, tick: 1.second
  		widget "Product Views",
		    title: "Views per Second",
		    type: :timeline,
		    width: 100,
		    gauges: :user_views_per_second,
		    include_current: true,
		    autoupdate: 1

	event :view_user do
		observe :popular_users, data[:username]
    	incr :user_views_per_second
	end


	event :view_article do
		observe :popular_articles, data[:title]
	end 

	event :view_journal do
		observe :popular_journals, data[:name]
	end
end

FnordMetric::Web.new(:port => 4242)
FnordMetric::Worker.new
FnordMetric.run