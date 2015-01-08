module GiftVotes

  class Plan

    def current_state
      budget.amount >= election.price ? :success : :pending
    end

    def add_gift_idea(idea)
      election.add_choice(idea)
    end

    def pledge(amount)
      budget.pledge(amount)
    end

    def budget
      @budget ||= Budget.new
    end

    def scores
      election.results
    end

    def vote(choice)
      election.vote(choice)
    end

    private
      def election
        @election ||= Election.new
      end




  end

end
