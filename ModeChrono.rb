load "ModeJeu.rb"


# Mode Chrono, jeu chronomètré
# La taille de la grille est fixe à 16 (soit la taille max des grilles du fichier)
class ModeChrono < ModeJeu
	def initialize
		super(16)
		@tempsDebut = Time.now
	end


	#Retourne le temps de jeu en secondes
	def tempsJeu
		return Time.now - @tempsDebut
	end
end
