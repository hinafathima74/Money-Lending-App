class CalculateInterestJob < ApplicationJob
  queue_as :default

  def perform
    Loan.where(status: 'open').find_each do |loan|
      interest = (loan.amount * loan.interest_rate) / 100
      loan.total_amount += interest
      loan.save
    end
  end
end
