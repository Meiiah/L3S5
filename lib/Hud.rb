require_relative 'Grille'

class Hud < Gtk::Grid
	# @fenetre
	# @btnOptions
	# @lblDescription

	def initialize(window)
		super()
		@fenetre = window
		@lblDescription = Gtk::Label.new

		initBoutonOptions

		self.attach(@btnOptions, 0, 25, 1, 1)
		self.attach(@lblDescription, 0, 0, 6, 1)


		self.halign = Gtk::Align::CENTER
		self.valign = Gtk::Align::CENTER
	end



	def lancementAventure(taille)
		# grille = Grille.new((taille-6)*100 + Random.rand((taille-5)*100 - (taille-6)*100),"grilles.txt");
		grille = Grille.new(Random.rand(Range.new((taille-6)*100+1,(taille-5)*100)),"grilles.txt")
		# aide = Aide.new(grille)
		@fenetre.changerWidget(self,HudAventure.new(@fenetre,grille))
	end

	def lancementAccueil
		puts "Retour à l'accueil"
		@fenetre.changerWidget(self,HudAccueil.new(@fenetre))
	end


	def lancementTutoriel(taille)
		grille = Grille.new(Random.rand(Range.new((taille-6)*100+1,(taille-5)*100)),"grilles.txt")
		puts "Retour à l'accueil"
		@fenetre.changerWidget(self,HudTutoriel.new(@fenetre,grille))
	end


	def lancementModeJeu
		puts "Retour au menu"
		@fenetre.changerWidget(self, HudModeDeJeu.new(@fenetre))
	end

	def lancementInscription
		puts " Page d'inscription "
		@fenetre.changerWidget(self, HudInscription.new(@fenetre))
	end

	def lancementRapide(taille)
		grille = Grille.new((taille-6)*100 + Random.rand((taille-5)*100 - (taille-6)*100),"grilles.txt");
		# aide = Aide.new(grille)
		@fenetre.changerWidget(self,HudRapide.new(@fenetre,grille))
	end

	# Créé et initialise le bouton des options
	# Le bouton affiche le menu des options
	def initBoutonOptions
		@btnOptions = Gtk::Button.new(:label=>"Options")
		@btnOptions.signal_connect("clicked") {
				@fenetre.changerWidget(self,HudOption.new(@fenetre,self))
		}
	end

	# Modifie la description : le texte en haut de la page
	def setDesc(str)
		@lblDescription.set_text(str)
	end

	# Modifie le titre de la fenetre
	def setTitre(str)
		@fenetre.set_title(str)
	end



end
