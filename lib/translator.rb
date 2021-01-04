require 'yaml'
require 'pry'

def load_library(path)
  load_emoticons = YAML.load_file(path)
  
  final_hash = {}
  load_emoticons.each do |emotion, array_position|
    if !final_hash[emotion]
      final_hash[emotion] = {english: array_position[0], japanese: array_position[1]}
    end
  end
  final_hash
end

def get_japanese_emoticon(path, emoticon)
  data = load_library(path)
  
  data.each do |word, lang|
    if data[word][:english] == emoticon
      
      return data[word][:japanese]
      break
    end
  end
  return "Sorry, that emoticon was not found"
end




def get_english_meaning(path, emoticon)
  
  data = load_library(path)
  data.each do |word, lang|
    if data[word][:japanese] == emoticon
      
      return word
      break
    end
  end
  return "Sorry, that emoticon was not found"
end