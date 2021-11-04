import React from 'react';

const Genre = (props) => {
	return (
		<div class="row">
			<button class="btn btn-primary ml-2 mr-2 px-3"  onClick={()=>props.filterMovies("All")}>All</button> 
			{
				props.genresList.map(item=> (
					<button class="btn btn-primary ml-2 mr-2 px-3" onClick={()=>props.filterMovies(item)}>{ item }</button> 
				))
			}
		</div>
	)
}
export default Genre;