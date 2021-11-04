import React from 'react';
import ToDoList from './Task1/ToDoList.js';
import "./App.css"

function App() {

	return (
		<React.Fragment>
      <div className={"App"}>
        <header className={"App-header"}>
          <ToDoList />
        </header>
      </div>
		</React.Fragment>
	)
}

export default App;
