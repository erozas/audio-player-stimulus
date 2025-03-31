# == Schema Information
#
# Table name: episodes
#
#  id           :integer          not null, primary key
#  duration     :integer
#  name         :string
#  published_at :datetime
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_episodes_on_slug  (slug) UNIQUE
#
require "test_helper"

class EpisodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
