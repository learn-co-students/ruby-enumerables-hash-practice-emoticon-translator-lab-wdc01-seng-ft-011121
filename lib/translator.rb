require "yaml"
require 'pry'

def load_library(path)
  
  emo = YAML.load_file(path)
  final_emo = {}
  emo.each do |meaning, sym_array|
     
        if !final_emo[meaning]
          final_emo[meaning] = {english: sym_array[0], japanese: sym_array[1]}
        end
  final_emo
  end
final_emo
end

def get_japanese_emoticon (path, emoticon)
  
  data = load_library(path)
  
  data.each do |word, lang|
    if data[word][:english] == emoticon
      return data[word][:japanese]
      break
    end

  end
  return "Sorry, that emoticon was not found"
  
end

def get_english_meaning (path, emoticon)
  
  data = load_library(path)
    data.each do |word, lang|
    if data[word][:japanese] == emoticon
      return word
      break
    end

  end
      return "Sorry, that emoticon was not found"
end
