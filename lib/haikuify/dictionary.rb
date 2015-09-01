module Haikuify
  class Dictionary
    DICTIONARY_PATH = "/data/dictionaries/standard.txt"

    def initialize
      @dictionary = {}
      parse
    end

    def count_syllables(word)
      dictionary[word]
    end

    private

    def parse
      File.foreach(file_path) do |line|
        word = line.split("¥")
        dictionary[word.join.strip] = word.count
      end
    end

    def file_path
      [gem_root_path, DICTIONARY_PATH].join
    end

    def gem_root_path
      File.dirname(File.expand_path(__FILE__))
    end

    attr_reader :path, :dictionary, :dictionary_name
  end
end
