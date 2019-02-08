load 'ModeJeu.rb'


class ModeAventure < ModeJeu

	def initialize
		super(6)
	end

	# Succession de grilles
	# Toute les 10 grilles la taille augmente
	# Commence à la taille 6 jusqu'à 16, soit 110 grilles
	def jouer
		(6..16).each { |niveau|
			puts "\n---- Niveau " + niveau.to_s + " ----\n"
			(1..10).each do |i|
				puts "Grille " + i.to_s
				super
				nouvelleGrille(niveau)
			end
		}
	end
end


jeu = ModeAventure.new
jeu.jouer
