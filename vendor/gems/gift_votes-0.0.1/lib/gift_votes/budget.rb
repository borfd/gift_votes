module GiftVotes

  class Budget

    def pledge(amount)
      pledges << amount
    end

    def amount
      pledges.reduce(:+) || 0
    end

    private
      def pledges
        @pledges ||= []
      end
  end

end
