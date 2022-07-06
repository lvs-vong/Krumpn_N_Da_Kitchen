import React from "react";
import { AiOutlineMenu } from "react-icons/ai";

import { useStateContext } from "../context/ContextProvider";
import Sidebar from "./Sidebar";
function AppContainer() {
    const { sideMenu, setSideMenu} = useStateContext();
    const withSideMenu = "ml-72";
    const noSideMenu = "ml-0";
    return (
        <div className="absolute h-screen w-screen bg-slate-300">
            <div>
                {sideMenu ? (
                    <div className="w-72 fixed bg-secondary">
                        <Sidebar /> 
                    </div>
                ) : (
                    <div className="hidden">
                        <Sidebar /> 
                    </div>
                )}
                <button type='button' 
                        className={`absolute rounded-full p-2 hover:bg-tertiary text-xl ${sideMenu ? 'hidden': noSideMenu}`}
                        onClick={() => setSideMenu(true)}>
                            <AiOutlineMenu/>
                </button>
                <div className={`p-16 ${sideMenu ? withSideMenu : noSideMenu}`}>
                    <h1>Hello</h1>
                </div>
            </div>
        </div>
    );
};

export default AppContainer;