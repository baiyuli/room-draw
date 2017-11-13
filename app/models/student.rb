class Student < ApplicationRecord
  belongs_to :user

  has_one :room_assignment
  has_one :pull, through: :room_assignment
  has_one :pull

  enum class_rank: [:freshman, :sophomore, :junior, :senior]

  validates :class_rank, presence: true
  validates :room_draw_number, presence: true
  validates :user, :presence => true

end
