import React, {useState} from 'react';

const ToDoList = () => { 
	let [toDoList, setToDoList] = useState([]);
	let [userInput,setUserInput]=useState("");
	const AddItemInList = () =>{
		if(userInput!=="")
		{
			setToDoList(toDoList.concat(userInput));
			setUserInput("");
		}	
	};
	return (
			<React.Fragment>
				<input type={"text"} value = {userInput}  onChange = { (e) => setUserInput(e.target.value) } />
				<button onClick = { AddItemInList }>Add</button> 
				<h2>To Do Tasks {toDoList.length}</h2>
				<ul>
					{toDoList.map((val) => (<li>{val}</li>))}
				</ul>
			</React.Fragment>
		)
}

export default ToDoList;