puts 'creating movies'

response = HTTParty.get('http://tmdb.lewagon.com/movie/top_rated')
response['results'].first(10).each do |result|
  title = result['original_title']
  overview = result['overview']
  base_url = 'https://image.tmdb.org/t/p/w500'
  poster_url = "#{base_url}#{result['poster_path']}"
  rating = result['vote_average']
  Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
end
puts 'movies done successfully'

