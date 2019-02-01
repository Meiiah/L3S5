##
# @title Profil
# @author KAJAK Rémi
# 
# Ce fichier gère le modèle de la table *Profil*, qui contient les informations des joueurs de l'application.
# 

##
# == Classe *Profil*
# 
# à compléter
# 
class Profil < ActiveRecord::Base
	# Un joueur possède plusieurs scores (un par grille de jeu)
	has_many :scores

	# @id_joueur, @pseudonyme, @mdp_encrypted - L'identifiant du joueur, une chaîne de caractères représentant son nom dans l'application, une chaîne de caractères lui permettant de se connecter à l'application

	##
	# == to_s
	# 
	# On redéfinit la méthode *to_s* dans cette classe pour qu'elle puisse afficher les informations de l'objet appelé.
	# 
	def to_s
		return "Joueur n°#{@id_joueur} : #{@pseudonyme}, mot de passe du compte (encrypté) : #{@mdp_encrypted}"
	end
end