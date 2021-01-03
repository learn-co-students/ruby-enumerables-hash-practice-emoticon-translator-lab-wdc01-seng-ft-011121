# require modules here
require "yaml"

def load_library(file)
  # code goes here
  lib = YAML.load_file(file)
  lib.each do |k, v|
    lib[k] = {:english => v[0], :japanese => v[1]}
  end
  return lib
end

def get_japanese_emoticon(file, emote)
  # code goes here
  temp = nil
  lib = load_library(file)
  lib.each do |key, value|
    value.each do |k, v|
      if v == emote
        temp = key
      end
    end
  end
  if temp == nil
    return "Sorry, that emoticon was not found"
  end
  return lib[temp][:japanese]
end

def get_english_meaning(file, emote)
  # code goes here
  temp = nil
  lib = load_library(file)
  lib.each do |key, value|
    value.each do |k, v|
      if v == emote
        temp = key
      end
    end
  end
  if temp == nil
    return "Sorry, that emoticon was not found"
  end
  return temp
end