import React, {useState} from 'react';
import Movie from './MovieFilter.js';
import Genre from './Genre.js';

const genres = ["Action", "Horror", "Sci-fi", "Drama", "Adventure"];
const moviesList = [
  {
    title: "Avengers Endgame",
    year: 2019,
    genre: "Action",
    cast: [
      { name: "Robert Downey Jr", role: "Iron Man" },
      { name: "Chris Hemsworth", role: "Thor" },
      { name: "Mark Ruffalo", role: "Hulk" },
    ],
  },
  {
    title: "Inception",
    year: 2010,
    genre: "Sci-fi",
  },
  {
    title: "The Imitation Game",
    year: 2014,
    genre: "Drama",
  },
  {
    title: "The Conjuring",
    year: 2013,
    genre: "Horror",
  },
  {
    title: "John Wick",
    year: 2014,
    genre: "Action",
  },
  {
    title: "Spider Man Homecoming",
    year: 2017,
    genre: "Action",
  },
  {
    title: "Inception",
    year: 2010,
    genre: "Sci-fi",
  },
  {
    title: "The Matrix",
    genre: "Sci-fi",
    year: 1999,
  },
];

const MovieApp = () => {
	let [genreValue, setGenreValue] = useState("All");
	return (
		<div class="container">
			<Genre filterMovies={setGenreValue} genresList = {genres}/>
			<Movie moviesList = {moviesList} genreValue={genreValue} />
		</div>
	)
}

export default MovieApp;