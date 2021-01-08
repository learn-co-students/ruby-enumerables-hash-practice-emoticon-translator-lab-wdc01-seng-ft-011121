# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  emoji_library = YAML.load_file(file_path)
  emoticons = {}
  emoji_library.each do |meaning, emoji_array|
    emoticons[meaning] = {:english => "", :japanese => ""}
    emoticons[meaning][:english] = emoji_array[0]
    emoticons[meaning][:japanese] = emoji_array[1]
  end
  emoticons
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  hash = load_library(file_path)
  hash.each do |meaning, emojis|
    if emojis[:japanese] == emoticon
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  hash = load_library(file_path)
  hash.each do |meaning, emojis|
    if emojis[:english] == emoticon
      return emojis[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end
