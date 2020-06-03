require 'pry'
require 'yaml'

def load_library(file_path)
                                          # code goes here  
    response = { "get_meaning" => {},
                "get_emoticon" => {}  }                            
    file = File.read(file_path)
    emoticons = YAML.load(file)
    emoticons.each do |meaning, emot|
      response["get_meaning"][emot[1]] = meaning
      response["get_emoticon"][emot[0]] = emot[1]
    end 
  response
end

####

def get_japanese_emoticon(file_path, emoticon)
                                          # code goes here
    response = nil
    library = load_library(file_path)
    
    library["get_emoticon"].each do |english, japanese|
    if emoticon == english 
      response = japanese
    end 
  end
    if response == nil
    return "Sorry, that emoticon was not found"
  else
    return response
  end
end

#  binding.pry

def get_english_meaning(file_path, emoticon)
                                          # code goes here
    response = nil
    library = load_library(file_path)
    library["get_meaning"].each do |english, meaning|
    if emoticon == english
      response = meaning
    end
  end
    if response == nil
    return "Sorry, that emoticon was not found"
  else
    return response
  end 
end
#      binding.pry
