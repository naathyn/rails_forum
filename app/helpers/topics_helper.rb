module TopicsHelper
  def latest_post
    comments.sort_by(&:updated_at).last || self
  end
end
