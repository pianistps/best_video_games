class BestVideoGames::VideoGame
  attr_accessor :name, :score, :console, :url

  def self.today
    #scrape gamerankings and return games based on data
    self.scrape_deals
  end

  def self.scrape_deals
    games = []

    games << self.scrape_gamerankings
    #Go to gamerankings, find game
    #extract properties
    #instantiate game
    games
  end

  def self.scrape_gamerankings
    doc = Nokogiri::HTML(open("http://www.gamerankings.com/browse.html"))
    binding.pry

     table_data = doc.css("body table").first
     #table_data.xpath("//tr").select do |x|
       #@name = x.css("td a")[0].text
     #end
  end
end
# table = doc.css("body table").first
#one game = tr
#name = doc.css("td a")[0].text
#score = doc.css("td span b")[0].text
#console_name = doc.css("td a").attribute("href").text.split("/")
#console = console_name[1]
#url = "http://www.gamerankings.com#{doc.css("td a").attribute("href").text}"
