class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :admin, class_name: 'User'

  after_initialize :set_default_status, if: :new_record?

  STATES = [
    'requested', 'approved', 'open', 'closed', 'rejected',
    'waiting_for_adjustment_acceptance', 'readjustment_requested'
  ]

  def set_default_status
    self.status ||= 'requested'
  end

  # Define state transitions
  state_machine :status, initial: :requested do
    event :approve do
      transition requested: :approved
    end

    event :reject do
      transition [:requested, :waiting_for_adjustment_acceptance] => :rejected
    end

    event :open do
      transition approved: :open
    end

    event :close do
      transition open: :closed
    end

    event :adjust do
      transition approved: :waiting_for_adjustment_acceptance
    end

    event :readjust do
      transition waiting_for_adjustment_acceptance: :readjustment_requested
    end
  end
end
