class Spectateur
  def rencontre(individu)
    individu.rencontre(self)
  end

  # Le spectateur réagit aux tours.
  def interagit(evenement, message)
    # Le spectateur applaudit lors de tours d'acrobatie ou siffle pendant les tours de musique
    case evenement
    when :acrobatie
      puts "Le spectateur applaudit pendant le tour d'acrobatie: #{message}"
    when :musique
      puts "Le spectateur siffle pendant le tour de musique: #{message}"
    else
      puts "Le spectateur ne réagit pas."
    end
  end
end

class Dressseur
  def initialize(singe)
    @singe = singe
  end

  def enseigne_tour(tour)
    @singe.apprend_tour(tour)
  end

  def rencontre(individu)
    # Chaque dresseur demande à son singe d'exécuter tous ses tours
    @singe.tours.each do |tour|
      tour_du_singe = "'#{tour[:nom]}' du singe #{@singe.id}"
      individu.interagit(tour[:type], tour_du_singe)
    end
  end
end

class Singe
  # getters
  attr_reader :id, :tours

  def initialize(id)
    @id = id
    @tours = [] # Chaque singe connaît une liste de tours
  end

  def apprend_tour(tour)
    @tours << tour
  end
end

# Le programme doit créer une instance du spectateur,
# deux instances de dresseurs et deux instances de singe
spectateur = Spectateur.new

dresseur_1 = Dressseur.new(Singe.new(1)) # Chaque dresseur a un singe.
dresseur_1.enseigne_tour({type: :acrobatie, nom: 'Marcher sur les mains'})
dresseur_1.enseigne_tour({type: :musique, nom: 'Jouer du tambour'})

dresseur_2 = Dressseur.new(Singe.new(2)) # Chaque dresseur a un singe.
dresseur_2.enseigne_tour({type: :acrobatie, nom: 'Effectuer un salto arrière'})
dresseur_2.enseigne_tour({type: :musique, nom: 'Jouer des cymbales'})

# Un spectateur croise deux dresseurs de singes
spectateur.rencontre(dresseur_1)
spectateur.rencontre(dresseur_2)
