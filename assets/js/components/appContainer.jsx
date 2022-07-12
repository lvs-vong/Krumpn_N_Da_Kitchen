import React from "react";
import { AiOutlineMenu } from "react-icons/ai";

import { useStateContext } from "../context/ContextProvider";
import Sidebar from "./Sidebar";
import RecipeCard from "./RecipeCard";

const recipe1 = {
    name: "Chicken Nuggets",
    description: "A super delicious description about a super delicious recipe of chicken nuggets!",
    prepTime: "1 hour",
    picture: "https://via.placeholder.com/200",
}
const recipe2 = {
    name: "Fried Eggs",
    description: "A super delicious description about a super delicious recipe of super FRIED EGGS!",
    prepTime: "10 mins",
    picture: "https://via.placeholder.com/800x400"
}

function AppContainer() {
    const { sideMenu, setSideMenu} = useStateContext();
    const withSideMenu = "ml-72 hidden sm:block";
    const noSideMenu = "ml-0";
    return (
        <div className="absolute min-h-full w-screen bg-gradient-to-b from-main via-secondary to-main">
            <div>
                {sideMenu ? (
                    <div className="w-full sm:w-72 fixed 
                                    border-double border-8 border-tertiary shadow-2xl shadow-main 
                                    bg-gradient-to-b from-secondary via-main to-secondary">
                        <Sidebar /> 
                    </div>
                ) : (
                    <div className="hidden">
                        <Sidebar /> 
                    </div>
                )}
                <button type='button' 
                        className={`fixed top-0 rounded-full p-2 text-tertiary hover:bg-quaternary text-xl ${sideMenu ? 'hidden': noSideMenu}`}
                        onClick={() => setSideMenu(true)}>
                            <AiOutlineMenu/>
                </button>
                <div className={`p-16 ${sideMenu ? withSideMenu : noSideMenu}`}>
                    <div className="flex flex-wrap gap-3 justify-center">
                        <RecipeCard recipe={recipe1}/>
                        <RecipeCard recipe={recipe2}/>
                        <RecipeCard recipe={recipe1}/>
                        <RecipeCard recipe={recipe2}/>
                    </div>
                    
                </div>
            </div>
        </div>
    );
};

export default AppContainer;