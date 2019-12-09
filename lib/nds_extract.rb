# Provided, don't edit
require 'directors_database'
require 'pp'



# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  
  
def movies_with_director_key (name, movies_collection)
  array = [] 
  i = 0 
  while i < movies_collection.length do 
    # p movies_collection[i][:movies][0]
    # pp directors_database[0][:movies]
    # pp movies_collection[i]
    array << (movie_with_director_name(name,movies_collection[i]))
    i+=1 
  end 
#   pp array
  return array
end

def movies_with_directors_set(source)
array = [] 
outer_counter = 0 
while outer_counter < source.length do 
    array << movies_with_director_key(source[outer_counter][:name],source[outer_counter][:movies])
    outer_counter+=1 
end
# pp array 
return array 
end

def gross_per_studio(collection)
  counter = 0 
  hash = {} 
  while counter < collection.length do 
    
    studio_name = collection[counter][:studio]
    movie_gross = collection[counter][:worldwide_gross]
    
    
    counter +=1
  end 
  
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
end



# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
