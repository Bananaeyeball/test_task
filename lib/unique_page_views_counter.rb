require_relative 'page_views_counter'
class UniquePageViewsCounter < PageViewsCounter
  private

  # returning page name with IP here just to be more verbose about why pages
  # with the same name are shown multiple times in unique views
  def build_page_views_count_hash
    IO.readlines(file).reduce(Hash.new(0)) do |acc, line|
      acc[line] += 1
      acc
    end
  end
end
