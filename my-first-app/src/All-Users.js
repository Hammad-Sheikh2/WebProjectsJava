import React, {useEffect, useState} from "react";

const AllUsers = () =>{

    const [allData,setAllData] = useState([]);
    const getUsers = async () => {
        const response =  await fetch("https://api.github.com/users");
        const result = await response.json();
        console.log(result);
        setAllData(result);
    }
    useEffect(()=>{
    getUsers();
    },[]);
    return (
        <React.Fragment>
        <div className ={"row"}>
            {
                allData.map( (item)  => 
                    {
                        const {login,avatar_url,html_url} =item
                        return (
                                <div className="col-lg-3 col-md-4 col-sm-6 pt-2" >
                                    <div class="card" >
                                        <img src={avatar_url} class="card-img-top" style={{borderRadius:"50%"}} alt={login}></img>
                                        <div class="card-body">
                                            <h5 class="card-title">{login.charAt(0).toUpperCase() + login.slice(1)}</h5>
                                            
                                            <a href={html_url} class="btn btn-primary">View Profile</a>
                                        </div>
                                    </div>
                                </div>
                        )

                    }
                )
                
            }
        </div>
        </React.Fragment>
    )

}
export default AllUsers 