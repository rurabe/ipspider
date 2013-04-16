namespace :spider do
  task :test => :environment do
    heroku = Heroku::Api.new
  end

  task :crawl => :environment do
    p UDPSocket.open {|s| s.connect("64.233.187.99", 1); s.addr.last}
  end
end