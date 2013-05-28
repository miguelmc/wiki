# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  summary    :text
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  attr_accessible :content, :summary, :title, :tag_list
  validates :title, presence: true
  validates :summary, presence: true
  validates :content, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments, as: :commentable

  acts_as_taggable

  default_scope order: 'articles.created_at DESC'

  audited except: :tag_list

  def logs(last_log = nil)
    audits = self.audits.updates.descending.includes(:user)
    last_log.nil? ? audits : audits.where("audits.id != ?", last_log.id)
  end
  def self.search(params = {})
    if params[:tag].present? && !params[:tag].blank?
      Article.tagged_with(params[:tag])
    else
      Article.all
    end
  end
end
