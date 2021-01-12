class Occassion < ApplicationRecord
  belongs_to :user
  validates :occassion, presence: true
  attribute :drink_num, :integer, default: 0

  def time_remaining
    passed_time = Time.now - created_at
    remaining_time = ((drink_num * 5400) - passed_time)
    Time.at(remaining_time, in: 0)
    # .strftime("%H:%M:%S")
  end
end
