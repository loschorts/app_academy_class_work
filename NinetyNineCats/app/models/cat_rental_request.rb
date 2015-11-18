class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED) }
  validate :no_conflicting_requests

  belongs_to :requested_cat,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: "Cat"

  protected
  def overlapping_requests?
    !find_conflicts.empty?
  end

  def find_conflicts
    query = CatRentalRequest
      .where.not(id: self.id)
      .where(status: 'APPROVED')
      .where(cat_id: cat_id)
      .where(<<-SQL, start_date: start_date, end_date: end_date)
        (start_date BETWEEN :start_date AND :end_date
          OR
        end_date BETWEEN :start_date AND :end_date)
      SQL
  end

  def no_conflicting_requests
    if overlapping_requests?
      self.errors[:base] << "Conflicting Approved Request Exists"
    end
  end
end
