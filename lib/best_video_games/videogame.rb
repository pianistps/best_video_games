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
  end
end
#name = doc.css("td a")[0].text
#score = doc.css("td span b")[0].text
#console =doc.css("").text
#url =
