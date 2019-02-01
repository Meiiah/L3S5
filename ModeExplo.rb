load 'ModeJeu.rb'

class ModeExplo < ModeJeu

	#Grille Initialisée à une taille aléatoire
	def initialize
		super(rand(6...16))
	end

	#Nouvelle grille de taille aléatoire
	def nouvelleGrille(n)
		super(rand(6...16))
	end


	def jouer
		(1..10).each do
			super
			self.nouvelleGrille(0)
		end
		return self
	end
end


# jeu = ModeExplo.new
# jeu.jouer
