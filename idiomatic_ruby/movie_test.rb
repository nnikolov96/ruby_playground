require 'minitest/autorun'
require_relative 'movie'
require 'date'

class MovieTest < MiniTest::Test
  def setup
    @movie = Movie.new({
      title: 'Star Wars',
      genre: 'Science Fiction',
      director: 'George Lucas',
      release_date: '1977-05-25',
      rotten_tomatoes: '93'
    })
  end

  def test_director
    assert_equal @movie.director, 'George Lucas'
  end

  def test_genre
    assert_equal 'Science Fiction', @movie.genre
  end

  def test_rotten_tomatoes
    assert_equal 93, @movie.rotten_tomatoes
  end

  def test_release_date
    assert_equal Date.new(1977, 5, 25), @movie.release_date
  end

  def test_comedy?
    assert_equal false, @movie.comedy?
    @movie.genre = 'comedy'
    assert_equal true, @movie.comedy?
  end
end
