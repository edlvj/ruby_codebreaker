require "spec_helper"

module Codebreaker
  RSpec.describe Game do
    let(:game) { Game.new }
    
    describe 'Start Game' do
      it 'check on empty secret code' do
        expect(game.instance_variable_get(:@secret_code)).not_to be_empty
      end

      it 'check on 4 numbers of secret code' do
        expect(game.instance_variable_get(:@secret_code).length).to eq(4)
      end

      it 'check secret code on numbers from 1 to 6' do
        expect(game.instance_variable_get(:@secret_code)).to match(/[1-6]+/)
      end
      
      it 'check hint on value 1' do
        expect(game.instance_variable_get(:@hint)).to eq(1)
      end
      
      it 'check atemps on value 10' do
        expect(game.instance_variable_get(:@attempts)).to eq(10)
      end  
    end

  describe "match code" do
    it 'use one attempt' do
      game.match_guess('1111')
      expect(game.instance_variable_get(:@attempts)).to eq(9)
    end
    
    it 'check on valid input' do
      expect(game.match_guess('wrong')).to eq("Your code is not valid")
   end
   
    it 'check on different combination' do
     cases.each do |arr|
        game.instance_variable_set(:@secret_code, arr[0])
        game.match_guess(arr[0])
        expect(game.win?).to eq(true)
        end
    end
  end
  
  context "status of game" do
    it 'User win game' do
      game.instance_variable_set(:@secret_code, '1111')
      game.match_guess('1111')
      expect(game.instance_variable_get(:@win_status)).to eq(true)
    end
    
    it 'User loose game' do
      game.instance_variable_set(:@attempts, 0)
      expect(game.loose?).to eq(true)
    end  
  end  
  
  def cases
    [
      %w[1111 1111 ++++],
      %w[1113 1112 +++],
      %w[1134 1166 ++],
      %w[1234 1567 +],
      %w[1234 4321 ----],
      %w[5432 2541 ---],
      %w[1244 4156 --],
      %w[5556 1115 -],
      %w[1243 1234 ++--],
      %w[4111 4444 +],
      %w[1532 5132 ++--],
      %w[3444 4334 +--],
      %w[1113 2155 +],
      %w[2245 4125 +--]
    ]
  end
end
end