load 'ModeJeu.rb'


class ModeAventure < ModeJeu

	def initialize
		super(6)
	end

	# Succession de grilles
	# Toute les 10 grilles la taille augmente
	# Commence à la taille 6 jusqu'à 16, soit 110 grilles
	def jeu
		(6...16).each {|niveau|
			10.times do
				nouvelleGrille(niveau)
			end
		}
	end
end
