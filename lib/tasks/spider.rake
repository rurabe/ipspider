namespace :spider do
  task :crawl, [:url, :channel] => :environment do |t,args|
    @mecha = Mechanize.new {|a| a.user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.65 Safari/537.31" }
    @url = args[:url]
    @page = @mecha.get( @url )
    @ip = UDPSocket.open {|s| s.connect("64.233.187.99", 1); s.addr.last} # IP address of the remote process
    data = {:ip => @ip, :title => @page.title, :url => @url}
    Pusher[args.channel].trigger('task',data.to_json)
  end
end