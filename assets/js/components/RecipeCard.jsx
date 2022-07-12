import React from "react";

const RecipeCard = ({recipe}) => {   
    return (
        <div className="relative bg-main h-60 w-96 border-double border-8 border-zinc-50 rounded-md">
            <button className="absolute h-full w-full bg-slate-900 opacity-0 hover:opacity-80"
                    style={{zIndex: '10000'}}>
                <div className="absolute w-full h-full text-white ml-0 top-0 p-3">
                    <div className="relative h-32 overflow-y-auto pt-2">
                        <p className="p-2 border-2 border-zinc-50 font-eightbit">{recipe.description}</p>
                    </div>
                    <p className="absolute bottom-2 right-3 font-semibold">{recipe.prepTime}</p>
                </div>

            </button>
            <div className="flex justify-center p-2">
               <img className="max-h-52" src ={recipe.picture}/> 
            </div>
            <div className="absolute w-full h-16 bottom-0">
                <div className="absolute h-full w-full bg-slate-900 opacity-75" style={{zindex: '-1'}}></div>
                <div style={{zindex: '1'}}><h1 className="absolute p-2 mt-2 text-tertiary text-1xl font-bold font-osa">{recipe.name}</h1></div>
            </div>
        </div>
    );
};

export default RecipeCard;