class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true, length: {minimum: 20}
  before_save :set_visit_count
  has_attached_file :cover, styles: { medium: "1280x780", thumb: "800x600" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  #Metodos privados
  def update_visits_count
    #self.save if self.visits_count.nil?
    self.update(visits_count: self.visits_count + 1)
  end
  private
  def set_visit_count
    self.visits_count ||= 0
  end
end
