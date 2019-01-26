load 'Grille.rb'

#Définie un mode de jeu
class ModeJeu

	#Créé un nouveau mode de jeu
	#n - la taille de la grille
	def initialize(n)
		nouvelleGrille(n);
	end

	#Change la grille de jeu
	#n - la taille de la nouvelle grille
	def nouvelleGrille(n)
		@grille = Grille.new(rand(Range.new(n*100-600, n*100-501)), "./grilles.txt");
	end


	def to_s
		return @grille.to_s
	end


	def jeu
	end
end
