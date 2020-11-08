class Movie
  attr_accessor :director, :release_date, :rotten_tomatoes, :title, :genre

  def initialize(csv_row)
    @director = csv_row[:director]
    @genre = csv_row[:genre]
    @release_date = Date.parse(csv_row[:release_date])
    @title = csv_row[:title]
    @rotten_tomatoes = csv_row[:rotten_tomatoes].to_i
  end

  def comedy?
    @genre == 'comedy'
  end

end
