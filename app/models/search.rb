class Search
  attr_reader :results

  def initialize(query)
    @results = HTTParty.get(url, query: { keyword: query })
  end
end
