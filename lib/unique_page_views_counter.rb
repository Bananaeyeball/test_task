class UniquePageViewsCounter < PageViewsCounter
  private

  def build_page_views_count_hash
    IO.readlines(file).reduce(Hash.new(0)) do |acc, line|
      acc[line] += 1
      acc
    end
  end
end
