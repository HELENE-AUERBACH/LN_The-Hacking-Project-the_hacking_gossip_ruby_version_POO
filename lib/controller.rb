require 'gossip'
require 'view'
#require 'pry'

class Controller
  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip # exécute la méthode create_gossip de la View afin de récupérer les infos de l'utilisateur
                                 # (c'est-à-dire le contenu et l'auteur du nouveau gossip, sous le format d'un Hash)
    author = params["author"]
    #puts "author : #{author}"
    content = params["content"]
    #puts "content : #{content}"
    gossip = Gossip.new(author, content) # crée une instance de Gossip avec Gossip.new en injectant ici les infos saisies par l'utilisateur
    gossip.save("gossip.csv") # demande au model de l'inscrire dans le CSV avec gossip.save
  end

  def index_gossips
    gossips_array = Gossip.all("gossip.csv") # demande au model un Array d'objets de la classe Gossip (Array qui contient tous les potins que l'on a en base)
    @view.index_gossips(gossips_array) # demande à la View d’exécuter sa propre méthode index_gossips qui affichera tous les potins contenus dans "gossips_array"
  end

  #binding.pry
end
