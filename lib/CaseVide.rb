require_relative 'Case'
require_relative 'StatutVide'

# Implémente Case pour les cases apparaissant vides au joueur à la création de 
# la grille. Un clic sur ces cases en modifie l'apparence et met à jour les
# valeurs du nombre de tentes (c'est-à-dire que cliquer sur une CaseVide pour en
# faire une tente décrémente le nombre de tentes restantes sur la ligne/colonne)
# Relativement à Case, une CaseVide dispose d'un statut visible en plus de son
# statut interne, ce qui permet de laisser au joueur la possibilité de se tromper. 
class CaseVide < Case
	
	def initialize(etat)
		@statut=StatutVide.new(etat)
		@statutVisible=StatutVide.new(VIDE)
	end
		
	# Fait cycler la case sur "vide->gazon->tente" et met à jour les indicateurs
	# de tente restante
	# TODO - vérifier que les i,j sont bien cohérents
	def cycle(i,j,grille)
		self.statutVisible.cycle
		
		if self.statutVisible.isTente? # le statut vient de devenir "tente" 
			grille.varTentesLigne[i]-=1
			grille.varTentesCol[j]-=1
		elsif self.statutVisible.isVide? # le statut était "tente" 
			grille.varTentesLigne[i]+=1
			grille.varTentesCol[j]+=1
		end
	
		if grille.varTentesLigne[i]==0 && grille.varTentesCol[j]==0
			puts "test partie finie"
			if grille.estComplete?
						puts "partie finie"
			end
		end
		
		self
	end
	def affichage
		if self.statutVisible.isGazon?
			'../img/gazon.png'
		elsif self.statutVisible.isTente?
			'../img/tente.png'
		end
	end
end
