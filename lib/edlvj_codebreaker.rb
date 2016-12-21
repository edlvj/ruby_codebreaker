require 'yaml'

module Codebreaker
  class Game
     
  HINT = 1
  ATTEMPS = 10
  
  PROPER = '+'
  WRONG_POSITION = '-'
    
  def initialize
    @secret_code = Array.new(4) { rand(1..6) }.join
    @hint = HINT
    @attempts = ATTEMPS
    @win_status = false
  end
    
  def match_guess(code)
    return "Your code is not valid" unless code.match(/(^([1-6]{4})$)/)
    
    @win_status = true if @secret_code == code
    @attempts -= 1
    secret = @secret_code.chars.map(&:to_i)
    
    res = []
    code.chars.map(&:to_i).each_with_index do |number, index|
      if number == secret[index]
        secret[index] = nil
        res << PROPER
      elsif secret.include? number
        secret[secret.find_index(number)] = nil
        res << WRONG_POSITION
      end  
    end 
   
    res.join
  end
    
  def loose?
    @attempts == 0  
  end  
  
  def win?
    @win_status
  end  

  def get_hint
    @hint -= 1
    @hint >= 0 ? @secret_code[rand(4)] : "Not Available"
  end 
  
  def save_stat( username )
    File.open('./stat.yml','a+') do |f|
      f.write([user: username, attempts: @attempts, date: Time.now].to_yaml)
    end
  end
  end
end    