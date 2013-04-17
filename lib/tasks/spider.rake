namespace :spider do
  task :crawl => :environment do
    p UDPSocket.open {|s| s.connect("64.233.187.99", 1); s.addr.last} # IP address of the remote process
  end
end