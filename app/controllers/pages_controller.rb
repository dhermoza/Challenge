class PagesController < ApplicationController

  def index

  end

  def results
    @result = balance(params[:string])
  end
# Programa para definir si un mensaje tiene los parentesis desbalanceados o no

  def balance(string)
    result = 'balanceado'
    array = []
    words = string.split('') # guardamos en un array words todos los caracteres de la frase a comprobar
    only_strings = string.gsub(/[)(]/, '') # guardamos en otro string sólo los caracteres sin parentesis
    words.each_with_index do |word, index| # recorremos el array words
      # solo agregamos un parentesis al array word si no es parte de un emoticon
      # o si el string sin parentesis contiene mas de un caracter
      if word == '(' && words[index - 1] != ':' && only_strings.length > 1 || word == ')' && words[index - 1] != ':'
        array.push(word)
      end
    end
    result = 'desbalanceado' if array.length.odd?
    return result
  end
end
