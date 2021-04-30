require 'csv'
#require 'pry'

class Gossip
  attr_reader :author # auteur (String) du potin
  attr_reader :content # contenu/texte (String) du potin
  
  PREFIX = 'LN_'.freeze # Ruby Freeze method basically make object constant or immutable
   
  def initialize(author, content)
    @author = author
    @content = content
  end

  def save(file_name)
    if check_name(file_name) # On vérifie le nom du fichier à créer via une méthode check_name (cf. plus bas)
      CSV.open("./db/#{PREFIX}#{file_name}", "a") do |csv_file| # le chemin relatif est donné par rapport au répertoire d'où est lancée l'application app.rb
        csv_file << [@author, @content]
        # To encode a quote, use ". One double quote symbol in a field will be encoded as "", and the whole field will become """".
        # A comma is simply encapsulated using quotes, so , becomes ",".
        # A comma and quote needs to be encapsulated and quoted, so "," becomes """,""".
      end
    else
      puts "Impossible de créer un fichier de nom \"./db/#{PREFIX}#{file_name}\"."
    end
  end

  private # Toutes les méthodes définies ci-après sont privées : il est interdit de pouvoir les appeler en dehors du code de la classe (donc interdit même dans le "main" ici-même dans ce fichier)

  def check_name(file_to_save_name)
    # Vérification simple du format du nom du fichier à sauvegarder.
    # Si le nom est ok, ça renvoie TRUE, sinon ça renvoie FALSE.
    # On veut vérifier que le file_to_save_name n'est ni nil, ni une instance d'une autre classe que celle des String, ni une chaîne vide :
    !file_to_save_name.nil? && file_to_save_name.instance_of?(String) && !file_to_save_name.strip.empty?
  end
  
  #binding.pry
end
