require 'yaml'

def load_library(file_path)
emojis = {}
YAML.load_file(file_path).each do |k, v|
  emojis[k] = {}
  emojis[k][:english] = v[0]
  emojis[k][:japanese] = v[1]
end
emojis
end

def get_japanese_emoticon (file_path, emoji)
library = load_library(file_path)
library.each {|key, value|
  hash = value.select {|a,b|
    b == emoji
  }
  if hash[:english] == emoji
    return value[:japanese]
  end
}
"Sorry, that emoticon was not found"
end


def get_english_meaning(file_path, emoji)
  library = load_library(file_path)
  library.each {|key, value|
    hash = value.select {|a,b|
      b == emoji
    }
    if hash[:japanese] == emoji
      return key
    end
  }
  "Sorry, that emoticon was not found"
end
