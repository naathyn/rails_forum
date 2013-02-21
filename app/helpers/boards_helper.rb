module BoardsHelper
  def latest_post
     [topics.last, comments.last].first
  end
end
