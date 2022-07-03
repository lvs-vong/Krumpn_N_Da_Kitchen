import React from "react";
import { useState } from "react";
function AppContainer() {
    const [sideMenu, setSideMenu] = useState(false);
    return (
        <div>
            {sideMenu ? (
                <h1 className="text-3xl font-bold underline">hello</h1>
            ) : (
                <h1 className="underline text-main">goodbye</h1>
            )}
        </div>
    );
};

export default AppContainer;