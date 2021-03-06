class HudModeDeJeu < Hud
	# @@tailleFacile
	# @@tailleMoyen
	# @@tailleDifficile

	# @btnTutoriel
	# @btnAvFacile
	# @btnAvMoyen
	# @btnAvDifficile
	# @btnRapideFacile
	# @btnRapideMoyen
	# @btnRapideDifficile

	def initialize (window)
		super(window)
		varX, varY = 4,4
		@@tailleFacile = 6
		@@tailleMoyen = 9
		@@tailleDifficile = 12
		self.setTitre("MODE DE JEU")



		initBoutonsAventure
		initBoutonsRapide
		initBoutonTuto
		initBoutonQuitter
		initBoutonChargerSauvegarde

		#Bouton sauvegarde !
		self.attach(@btnSauvegarde,varX,varY-2,2,1)

		self.attach(@btnTutoriel,varX, varY, 2, 1)

		self.attach(Gtk::Label.new("Mode Aventure"),varX, varY+1, 2, 1)
			self.attach(@btnAvFacile,varX+1, varY+2, 1, 1)
			self.attach(@btnAvMoyen,varX+1, varY+3, 1, 1)
			self.attach(@btnAvDifficile,varX+1, varY+4, 1, 1)

		self.attach(Gtk::Label.new("Partie rapide"),varX, varY+5, 2, 1)
			self.attach(@btnRapideFacile,varX+1, varY+6, 1, 1)
			self.attach(@btnRapideMoyen,varX+1, varY+7, 1, 1)
			self.attach(@btnRapideDifficile,varX+1, varY+8, 1, 1)

		self.attach(@btnOptions, varX, varY+10, 1, 1)

		self.attach(@btnQuitter, varX+1, varY+10, 1, 1)

			fond = self.ajoutFondEcran
		self.attach(fond,0,0,varX+6,varY+14)
	end

	def initBoutonChargerSauvegarde
		@btnSauvegarde = Gtk::Button.new :label => "Charger une sauvegarde"
		@btnSauvegarde.signal_connect('clicked') {
			puts(" Je ne fais actuellement rien, mais j'aimerai charger une sauvegarder et j'aime aussi les Pommes.")
		}
	end


	def initBoutonsAventure
		@btnAvFacile = Gtk::Button.new :label => "Facile"
		@btnAvMoyen = Gtk::Button.new :label => "Moyen"
		@btnAvDifficile = Gtk::Button.new :label => "Difficile"

		@btnAvFacile.signal_connect('clicked') {
			puts "Lancement du mode facile d'Aventure"
			#Niveau entre 6 et 9
			lancementAventure(@@tailleFacile)
		}
		@btnAvMoyen.signal_connect('clicked') {
			puts "Lancement du mode moyen d'Aventure"
			#Niveau entre 9 et 12
			lancementAventure(@@tailleMoyen)
		}
		@btnAvDifficile.signal_connect('clicked') {
			puts "Lancement du mode difficile d'Aventure"
			#Niveau entre 12 et 16
			lancementAventure(@@tailleDifficile)
		}
	end

	def initBoutonsRapide
		@btnRapideFacile = Gtk::Button.new :label => "Facile"
		@btnRapideMoyen = Gtk::Button.new :label => "Moyen"
		@btnRapideDifficile = Gtk::Button.new :label => "Difficile"

		@btnRapideFacile.signal_connect('clicked') {
			puts "Lancement du mode facile de rapide"
			#Niveau entre 6 et 9
			lancementRapide(Random.rand(Range.new(@@tailleFacile, @@tailleFacile+3)))
		}
		@btnRapideMoyen.signal_connect('clicked') {
			puts "Lancement du mode moyen de rapide"
			#Niveau entre 9 et 12
			lancementRapide(Random.rand(Range.new(@@tailleMoyen, @@tailleMoyen+3)))
		}
		@btnRapideDifficile.signal_connect('clicked') {
			puts "Lancement du mode difficile de rapide"
			#Niveau entre 12 et 16
			lancementRapide(Random.rand(Range.new(@@tailleDifficile, @@tailleDifficile+4)))
		}
	end

	def initBoutonTuto
		@btnTutoriel = Gtk::Button.new :label => " Tutoriel"
		@btnTutoriel.signal_connect('clicked') {
			puts "Lancement du mode tutoriel"
			#Niveau le plus facile : 6
			lancementTutoriel(@@tailleFacile)
		}
	end

	def initBoutonQuitter
		@btnQuitter = Gtk::Button.new label: "Quitter"
		@btnQuitter.signal_connect("clicked") { Gtk.main_quit }
	end
end
