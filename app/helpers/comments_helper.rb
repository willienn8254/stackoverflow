# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  body             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_id   :integer
#  commentable_type :string
#  user_id          :integer
#

module CommentsHelper
end
