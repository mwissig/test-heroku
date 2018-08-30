class Employee < ApplicationRecord
  belongs_to :department

  def full_name
    self.first_name + " " + self.last_name
  end

  def generate_eid
    self.eid = SecureRandom.hex(3).upcase
  end

end
