require_relative 'page_views_counter'
class UniquePageViewsCounter < PageViewsCounter
  private

  def build_page_views_count_hash
    build_map_url_to_ips.reduce({}) do |acc, item|
      acc[item.first] = item[1].uniq.count
      acc
    end.sort_by { |k, v| v }.reverse
  end

  def build_map_url_to_ips
    IO.readlines(file).reduce(Hash.new { |h, k| h[k] = [] }) do |acc, line|
      splitted_line = line.split
      next if splitted_line.empty?
      next if splitted_line[1] = /d{3}/
      acc[splitted_line.first] << splitted_line[1]
      acc
    end
  end
end
