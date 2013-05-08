# == Schema Information
#
# Table name: logs
#
#  id         :integer          not null, primary key
#  article_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Log < ActiveRecord::Base
  attr_accessible :article_id
  belongs_to :article
  belongs_to :user
  validates :article_id, presence: true
  validates :user_id, presence: true
end
