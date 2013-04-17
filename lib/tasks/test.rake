namespace :test do
  task :spider => :environment do
    heroku = Heroku::API.new
    5.times.map do
      Thread.new { heroku.post_ps('ipspider','rake spider:crawl') }
    end.map(&:join)
  end
end