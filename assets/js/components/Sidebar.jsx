import React from 'react';
import { useStateContext } from '../context/ContextProvider';
import {  MdOutlineCancel } from 'react-icons/md';
import { links } from '../context/Links';
const Sidebar  = () => {
    const { sideMenu, setSideMenu } = useStateContext();
    const normalLink = 'flex items-center gap-5 pl-4 pt-3 pb-2.5 rounded-lg text-md hover:border-double hover:border-4 hover:border-quaternary cursor-pointer font-eightbit';
    const activeLink = 'flex items-center gap-5 pl-4 pt-3 pb-2.5 text-md border-l-4 border-tertiary font-eightbit';
    const closeSideBar = () => {
        setSideMenu(false);
    }
    console.log(window.location.origin + "/home");
    console.log(window.location.href);
    return (
        <div className='h-screen shadow-xl px-2 cursor-default
                        md:overflow-hidden overflow-auto 
                        md:hover:overflow-auto pb-10 text-tertiary'>
            <div className='flex'>
                <h1 className='border-b-4 border-tertiary text-xl p-3 font-osa'>Krumpn N Da Kitchen {sideMenu}</h1>
                <button type='button' 
                        className='absolute right-1 rounded-full p-2 hover:bg-quaternary text-xl'
                        onClick={closeSideBar}><MdOutlineCancel /></button>
            </div>
            {links.map((item) => (
                <div key={item.title}>
                    <p className='m-3 mt-4 uppercase font-osa'>
                        {item.title}
                    </p>
                    {item.links.map((link) => (
                        <a key={link.name} className={`${(window.location.href == window.location.origin+link.link) ? activeLink : normalLink}`}>{link.icon} {link.name}</a>
                    ))}
                </div>
            ))
            }
        </div>
    )
};

export default Sidebar;