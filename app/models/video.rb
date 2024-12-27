# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  visible     :boolean          default(FALSE)
#  duration    :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer          not null
#
class Video < ApplicationRecord
  belongs_to :course
  has_many :video_categories
  has_many :comments, as: :commentable
  has_many :categories, through: :video_categories, after_add: :new_category
  # normal relationship
  # has_many :categories, through: :video_categories

  # With lambda functions
  has_many :categories, -> {where('categories.visible = ?', true)}, through: :video_categories



  validates :title, presence: true
  validates :title, length: {maximum: 200, minimum: 2}

  validate :validate_custom_title

  # callbacks
  before_save :send_notification
  after_save :send_email

  # scopes
  scope :has_duration, -> { where('duration >= ?', 0) }
  scope :has_description, -> { where.not(description: nil) }
  scope :has_description_and_duration, -> { has_description.has_duration }

  private

  def send_notification
    puts "Sending notification of new video added"
  end

  def send_email
    puts "Sending email to codigofacilito@gmail.com"
  end

  def validate_custom_title
    errors.add(:title, "Invilid title text") if title == 'codigofacilito'
  end

  def new_category(category)
    puts "New category \"#{category.title}\" added to video #{title}"
  end
end
