#CLI controller
class BestVideoGames::CLI

  def call
    list_games
    menu
    goodbye
  end

  def menu
    #puts "Best Video Games by score"
    # puts <<-DOC.gsub /^\s*/, ''
    # What range would you like to see?
    # 1-20, 20-40, 40-60, 60-80, or 80-100?
    # DOC
    # input = gets.strip
    # if input.to_i < 20 && input.to_i >=1
    #   list_games
    # elsif input.to_i < 40 && input.to_i >= 20
    #   puts "Video Games 20-40"
    # elsif input.to_i < 60 && input.to_i >= 80
    #   puts "Video Games 60-80"
    # elsif input.to_i < 80 && input.to_i >= 100
    #   puts "Video Games 20-40"
    # end
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
