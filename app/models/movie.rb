require 'nokogiri'
require 'open-uri'
class Movie < ApplicationRecord
  has_many :users_movies
  has_many :users, through: :users_movies
  has_many :comments

  scope :trending, -> { Movie.left_joins(:comments).group(:id).order("count(comments.movie_id) desc") }


  def self.create_from_link(link)
      mov = Nokogiri::HTML(open(link))
      new_movie = Movie.find_or_create_by(title:mov.css(".title_wrapper h1").children.first.text)
      if !new_movie.stars?
        stars = mov.css(".credit_summary_item").last.css("a").children.collect {|star| star.text}
        stars.pop if stars.last.include?("See full cast")
        new_movie.stars = stars
        new_movie.genres = mov.css(".subtext a").map {|genre| genre.text unless genre.text =~ /\d/}.compact
        new_movie.rating = mov.css(".subtext").children.first.text.strip if !mov.css(".subtext").children.first.text.strip.empty? 
        new_movie.runtime = mov.css(".subtext time").text.strip
        new_movie.release_date = mov.css(".subtext a").last.text.strip
        new_movie.summary = mov.css(".summary_text").text.strip
        new_movie.image_url = mov.css(".poster img").attribute("src").value if !mov.css(".poster img").empty?
        unless mov.css(".slate a").first == nil
          new_movie.trailer_link = "https://www.imdb.com/" + mov.css(".slate a").first.attributes["href"].value
        else
          new_movie.trailer_link = "No Trailer Available"
        end
        new_movie.link = link
        new_movie.save
        new_movie
      else
        new_movie
      end
    end

    def sorted_comments # scope?
      self.comments.sort_by { |c| c.updated_at}
    end
  
end
