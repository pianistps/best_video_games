#CLI controller
class BestVideoGames::CLI
  attr_accessor :name, :score, :console, :url

  def call
    menu
    goodbye
  end

  def menu
    input = nil
    while input != "exit"
      list_games
      puts <<-DOC.gsub /^\s*/, ''
      Which Video game would you like more info about?
      To list video game ranges type list games or exit to leave.
      DOC

      input = gets.strip.downcase
      if input.to_i > 0
        the_game = @games[input.to_i-1]
        puts "#{the_game.name} - Score: #{the_game.score} - Console: #{the_game.console}"
      elsif input == "list games"
        list_games
      else
        puts "Not sure what you want,Please type list games or exit."
      end
    end
  end

  def list_games
    puts "Best Video Games by score(last 90 days)"
    @games = BestVideoGames::VideoGame.today
    @games.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name} - Score: #{game.score} - Console: #{game.console}"
    end
  end

  def goodbye
    puts "Goodbye! Come Again!"
  end
end
