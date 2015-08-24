module Haikuify
  class SyllableCounter
    COUNTING_STRATEGIES = [
      Dictionary.new,
      HyphenatorGuess.new
    ]

    def count(word)
      COUNTING_STRATEGIES.detect do |strategy|
        strategy.count_syllables(word)
      end.count_syllables(word)
    end
  end
end
