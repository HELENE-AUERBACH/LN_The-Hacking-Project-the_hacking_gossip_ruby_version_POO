#require 'pry'

class View
  def create_gossip
    author = get_answer("Qui est l'auteur de ce nouveau potin?",
                        "Un auteur peut être désigné au minimum par l'initiale de son nom/prénom suivie d'un point et au maximum par 50 caractères.", 2)
    content = get_answer("Quel est le contenu de ce nouveau potin?",
                         "Un potin doit au minimum être constitué de 3 caractères et il ne peut excéder 200 caractères de long (espaces intermédiaires/caractères de ponctuation inclus).",
                         3, 200)
    return {"author" => author, "content" => content}
  end
  
  private

  def check_answer?(answer, minimum_size, maximum_size)
    return !answer.nil? && answer.instance_of?(String) && !answer.strip.empty? && answer.strip.length.between?(minimum_size, maximum_size)
  end

  def get_answer(query, reason_for_refusal, minimum_size, maximum_size = 50)
    answer = nil
    while !check_answer?(answer, minimum_size, maximum_size)
      print "\n#{query}\n> "
      answer = gets.chomp.strip
      if !check_answer?(answer, minimum_size, maximum_size)
        puts "#{reason_for_refusal}"
      end
    end
    answer
  end

  #binding.pry
end
