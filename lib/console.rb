require "./lib/edlvj_codebreaker.rb"

module Codebreaker
  class Console

  def initialize
    @game = Game.new
  end
    
  def play
    puts "You have #{Game::ATTEMPS} attemps and #{Game::HINT} hint.
    Enter 'hint' for get hint. And 'exit' for exit from a game."
  
    until @game.loose?
      case code = gets.chomp
        when 'hint'
        puts "The hint is #{ @game.get_hint }"
        when 'exit'
        exit
        when /^[1-6]{4}$/
        puts @game.match_guess(code)
      end
      break if @game.win?
    end
    
    save
    @game = Game.new if try_again?
    play
  end  
    
  def try_again?
    puts 'Do you want try again?(y/n)'
    gets.chomp == 'y' ? true : exit
  end
  
  def save
    puts 'Enter your name:'
    user_name = gets.chomp
    @game.save_stat( user_name )
  end  
  end
end