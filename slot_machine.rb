# #score
# 1. definir @score 
# 2. @reels deve ser uma array, ex: [:joker, :joker, :star]
# 3. criar hash com pontuacao { joker: 50, star: 40, ... } 
# 4. pontuacao max: 3 iguais (verificar unicidade do simbolo)
# 5. pontuacao p/ dois jokers
# 6. pontuacao p/ 1 joker + dois simbolos iguais
# 7. demais resultados = 0

class SlotMachine
  attr_accessor :reels

  SCORE = {
    joker: 50,
    star: 40,
    bell: 30,
    seven: 20,
    cherry: 10
  }

  def initialize(reels = [])
    @reels = reels
    # @total_score = 0
  end

  def score
    @reels
    if @reels.uniq.count == 1
      # total_score +=
      SCORE[@reels[0]]
    elsif @reels.count(:joker) == 2
      # total_score +=
      25
    elsif @reels.count(:joker) == 1 && @reels.uniq.count == 2
      @reels.delete(:joker)
      # total_score +=
      SCORE[@reels[0]] / 2
    else
      # total_score +=
      0
    end
  end

  def play
    # esvaziar @reels
    @reels = []
    # repopular @reels
    3.times do
      @reels << SCORE.keys.sample
    end
    # mostrar o resultado
    p @reels
    # calcular a pontuacao
    score
  end
end
