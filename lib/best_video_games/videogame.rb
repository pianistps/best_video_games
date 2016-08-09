class BestVideoGames::VideoGame
  attr_accessor :name, :score, :console, :url

  def self.today
    #scrape metacritic and return games based on data
    self.scrape_deals
  end

  def self.scrape_deals
    games = []

    games << self.scrape_metacritic
    #Go to metacritic, find game
    #extract properties
    #instantiate game
    games
  end

  def self.scrape_metacritic
    doc = Nokogiri::HTML(open("http://www.metacritic.com/browse/games/score/metascore/90day/all/filtered?sort=desc"))
    binding.pry
  end
end
