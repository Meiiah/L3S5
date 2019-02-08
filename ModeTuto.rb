load 'ModeJeu.rb'

class ModeTuto < ModeJeu
	def initialize
		super(6)
	end
end

m = ModeTuto.new
m.jouer
