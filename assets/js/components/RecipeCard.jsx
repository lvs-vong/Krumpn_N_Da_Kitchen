import React from "react";

const RecipeCard = () => {   
    return (
        <div className="relative bg-main h-60 w-96 border-8 border-zinc-50 rounded-md">
            <button className="absolute h-full w-full bg-slate-900 opacity-0 hover:opacity-80"
                    style={{zIndex: '10000'}}>
                <div className="absolute w-full h-full text-white ml-0 top-0 p-3">
                    <h1 className="text-2xl underline">Chicken Nuggets</h1>
                    <div className="relative h-32 overflow-y-auto pt-2">
                        <p className="p-2 border-2 border-zinc-50">A super delicious description of super delicous chicken nuggets made by me!</p>
                    </div>
                    <p className="absolute bottom-2 right-3 font-semibold">Prep Time: 1 hour</p>
                </div>

            </button>
            <div className="flex justify-center p-2">
               <img src = "https://via.placeholder.com/200"/> 
            </div>
            <div className="absolute w-full h-16 bottom-0">
                <div className="absolute h-full w-full bg-slate-900 opacity-75" style={{zindex: '-1'}}></div>
                <div style={{zindex: '1'}}><h1 className="absolute p-2 mt-2 text-tertiary text-2xl font-bold">Chicken Nuggets</h1></div>
            </div>
        </div>
    );
};

export default RecipeCard;