# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :string(255)
#  category_id            :integer
#

require 'spec_helper'

describe User do
    let(:user) { create(:user)}
	
	subject { user }

	it { should respond_to(:email) }
	it { should respond_to(:username) }
	it { should respond_to(:encrypted_password) }
	it { should have_many(:articles) }

	it { should validate_uniqueness_of(:email) }
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:username) }
	it { should validate_uniqueness_of(:username) }



end
