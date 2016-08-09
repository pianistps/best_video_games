#CLI controller
class BestVideoGames::CLI

  def call
    list_games
    menu
    goodbye
  end

  def menu
    input2 = nil
    while input2 != "exit"
      puts <<-DOC.gsub /^\s*/, ''
      Which Video game would you like more info about?
      To list video game ranges type list games or exit to leave.
      DOC
      input2 = gets.strip.downcase
      case input2
      when "1"
        puts "info on 1"
      when "2"
        puts "info on 2"
      when "list games"
        list_games
      else
        puts "Not sure what you want,Please type list games or exit."
      end
    end
  end

  def list_games
    puts "Best Video Games by score(last 90 days)"
    @games = BestVideoGames::VideoGame.today
  end

  def goodbye
    puts "Goodbye! Come Again!"
  end
end
