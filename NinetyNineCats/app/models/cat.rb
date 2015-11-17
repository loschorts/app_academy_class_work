class Cat < ActiveRecord::Base
  CAT_COLORS = %w(calico blue grey black white tabby)

  validates :color, inclusion: { in: CAT_COLORS }
  validates :sex, inclusion: { in: %w(M F) }
  validates :color, :birth_date, :name, presence: true


  def age
    Date.today.year - self.birth_date.year
  end
end
