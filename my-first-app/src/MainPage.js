import AllUsers from './All-Users.js';
import Home from "./Home.js";
import React, { useState } from "react";

const MainPage = ()=>
{   let [bodySelction,setBodySelection]=useState("Home");
    return (
        <React.Fragment>
            <nav class="navbar navbar-expand-md navbar-dark bg-primary">
                <div class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-phone-alt"></i> +923432211432</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-map-marker-alt"></i> Gujranwala</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="far fa-envelope"></i> abc@xyz.com</a>
                        </li>
                    </ul>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse2">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fab fa-facebook-f"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fab fa-twitter"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fab fa-google-plus-g"></i></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fab fa-linkedin-in"></i></a>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
                
                <h5 class="my-0 mr-md-auto font-weight-normal text-primary"><img src="https://source.unsplash.com/user/erondu/1600x1440" alt="Logo" width="100px" height="50px"/></h5>
                <nav class="my-2 my-md-0 mr-md-3 menu">
                    <a class="p-2 text-dark " onClick={()=>{setBodySelection("Home")}}>HOME</a>
                    <a class="p-2 text-dark " onClick={()=>{setBodySelection("Users")}}>USERS</a>
                    <a class="p-2 text-dark " href="#">SHOP</a>
                    <a class="p-2 text-dark " href="#">ABOUT</a>
                    <a class="p-2 text-dark " href="#">CONTACT</a>
                </nav>
                <a class="btn btn-primary" href="#">Free Download</a>
                <nav class="my-2 my-md-0 mr-md-3 menu">
                    <a class="p-2 text-dark " href="#"><i class="fas fa-cog"></i></a>
                    <a class="p-2 text-dark " href="#"><i class="fas fa-shopping-cart"></i></a>
                </nav>
            </div>
            {bodySelction==="Users"?(<AllUsers></AllUsers>):(<React.Fragment></React.Fragment>)}
            {bodySelction==="Home"?(<Home></Home>):(<React.Fragment></React.Fragment>)}
            
        </React.Fragment>
    ) 
}
export default MainPage;