# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  summary    :string(255)
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :content, :summary, :title
  validates :title, presence: true
  validates :summary, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :logs


end
