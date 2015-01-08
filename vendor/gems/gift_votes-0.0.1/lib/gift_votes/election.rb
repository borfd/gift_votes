module GiftVotes

  class Election

    class NoWinner
      def price
        Float::INFINITY
      end
    end

    attr_reader :choices

    def initialize(options = {})
      @choices = options.fetch(:choices, [])
    end

    def vote(choice)
      scores[choice] = scores[choice] + 1
    end

    def winner
      if results.first && results.first.first && results.first.first.price
        results.first.first.price
        results.first.first
      else
        NoWinner.new
      end
    end

    def results
      scores.sort_by {|k, v| -v}
    end

    def add_choice(choice)
      choices << choice
      scores[choice] = 0
    end

    def price
      winner.price
    end

    private

      def scores
        @scores ||= make_scoretable
      end

      def make_scoretable
        Hash[choices.map {|choice| [choice, 0]}]
      end

  end

end
