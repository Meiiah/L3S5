load 'ModeJeu.rb'

class ModeExplo < ModeJeu
	def initialize
		super(rand(6...16))
	end


	def nouvelleGrille(n)
		super(rand(6...16))
	end
end
