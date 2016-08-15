class BestVideoGames::VideoGame
  attr_accessor :name, :score, :console, :url, :description

  def self.today
    #scrape gamerankings and return games based on data
    games = self.scrape_gamerankings
    #Go to gamerankings, find game
    #extract properties
    #instantiate game
    games
  end

  def self.scrape_gamerankings
    doc = Nokogiri::HTML(open("http://www.gamerankings.com/browse.html"))
    table_data = doc.css("body table").first

    table_data.xpath("//tr").collect do |x|
      game = self.new
      game.name = x.css("td a")[0].text
      game.score = x.css("td span b")[0].text
      console_name = x.css("td a").attribute("href").text.split("/")
      game.console = console_name[1]
      game.url = "http://www.gamerankings.com#{x.css("td a").attribute("href").text}"
      game.description = self.scrape_description(game.url)
      game
    end
  end

  def self.scrape_description(game_url)
    doc = Nokogiri::HTML(open(game_url))

    doc.css("div.details").first.text
  end
end
