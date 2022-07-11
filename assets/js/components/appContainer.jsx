import React from "react";
import { AiOutlineMenu } from "react-icons/ai";

import { useStateContext } from "../context/ContextProvider";
import Sidebar from "./Sidebar";
import RecipeCard from "./RecipeCard";


function AppContainer() {
    const { sideMenu, setSideMenu} = useStateContext();
    const withSideMenu = "ml-72 hidden sm:block";
    const noSideMenu = "ml-0";
    return (
        <div className="absolute min-h-full w-screen bg-slate-300">
            <div>
                {sideMenu ? (
                    <div className="w-full sm:w-72 fixed bg-secondary">
                        <Sidebar /> 
                    </div>
                ) : (
                    <div className="hidden">
                        <Sidebar /> 
                    </div>
                )}
                <button type='button' 
                        className={`fixed top-0 rounded-full p-2 hover:bg-tertiary text-xl ${sideMenu ? 'hidden': noSideMenu}`}
                        onClick={() => setSideMenu(true)}>
                            <AiOutlineMenu/>
                </button>
                <div className={`p-16 ${sideMenu ? withSideMenu : noSideMenu}`}>
                    <div className="flex flex-wrap gap-3 justify-center">
                        <RecipeCard />
                        <RecipeCard />
                        <RecipeCard />
                        <RecipeCard />
                    </div>
                    
                </div>
            </div>
        </div>
    );
};

export default AppContainer;