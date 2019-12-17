# frozen_string_literal: true

class Transactions

  def date_reformat(date_entered)
    date_entered.gsub(/-/, '/')
  end
end
