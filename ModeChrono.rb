load "ModeJeu.rb"


# Mode Chrono, jeu chronomètré
# La taille de la grille est fixe à 16 (soit la taille max des grilles du fichier)
class ModeChrono < ModeJeu
	def initialize
		super(16)
	end

	#Initialise le timer
	def initTimer
		@tempsJeu = Time.now
		return self
	end

	#Retourne le temps de jeu en secondes
	def tempsJeu
		return Time.now - @tempsJeu
	end


	#Boucle de jeu du mode chrono
	#Retourne le temps que le joueur a mis pour résoudre la grille
	def jouer
		self.initTimer
		super
		return self.tempsJeu
	end
end


jeu = ModeChrono.new
puts "Temps de jeu " + jeu.jouer.to_s + " secondes"
