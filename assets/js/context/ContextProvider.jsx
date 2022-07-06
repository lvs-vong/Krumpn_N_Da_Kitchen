import React, { createContext, useContext, useState } from 'react';

const StateContext = createContext();


export const ContextProvider = ({ children }) => {
    const [sideMenu, setSideMenu] = useState(true);
    return (
        <StateContext.Provider value={{ sideMenu, setSideMenu }}>
            {children}
        </StateContext.Provider>
    )
};

export const useStateContext = () => useContext(StateContext);