import React from 'react';

const Movie = (props) => {
	return (
		<div class="row">
			{
				props.moviesList.map(item => ( props.genreValue==="All" || item.genre===props.genreValue ? (
					<div class="col-4 p-2">
						<div class="border p-2">
							<div><b>{ item.title }</b></div>
							<div><b>{ item.year }</b></div>
							<div>{ item.genre }</div>
						</div>
					</div> ) : (<React.Fragment></React.Fragment>)))
			}
		</div>
	)
}
export default Movie;