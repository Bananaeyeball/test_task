require_relative 'page_views_counter'
class UniquePageViewsCounter < PageViewsCounter
  private

  def build_page_views_count_hash
    build_map_url_to_ips.reduce({}) do |acc, item|
      acc[item.first] = item[1].uniq.count
      acc
    end
  end

  def build_map_url_to_ips
    IO.readlines(file).reduce(Hash.new { |h, k| h[k] = [] }) do |acc, line|
      acc[line.split.first] << line.split[1]
      acc
    end
  end
end
