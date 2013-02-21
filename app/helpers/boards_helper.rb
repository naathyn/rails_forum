module BoardsHelper
  def latest_post
    latest_topic = topics.sort_by(&:updated_at)
    latest_comment = comments.sort_by(&:updated_at)
    latest_post = latest_topic + latest_comment
    latest_post.sort_by(&:updated_at).last
  end
end
