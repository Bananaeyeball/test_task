class PageViewsPrinter
  def self.call(page_views_hash, unique_page_views_hash)
    new(page_views_hash, unique_page_views_hash).call
  end

  def initialize(page_views_hash, unique_page_views_hash)
    @page_views_hash = page_views_hash
    @unique_page_views_hash = unique_page_views_hash
  end
  attr_reader :page_views_hash, :unique_page_views_hash

  def call
    print_page_views
    puts "="*100 + "\n"
    print_unique_page_views
  end

  private

  def print_page_views
    puts "All Page Views\n"
    page_views_hash.each { |k, v| v.each { |v| puts "#{v.join(" ")} visits" } }
  end

  def print_unique_page_views
    puts "Unique Page Views\n"
    unique_page_views_hash.each do |k, v|
      puts "#{k} #{v} visits"
    end
  end
end
