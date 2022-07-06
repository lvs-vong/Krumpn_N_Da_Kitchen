import React from 'react';
import { useStateContext } from '../context/ContextProvider';
import { FaBeer } from 'react-icons/fa';
import { TbMeat } from 'react-icons/tb';
import { MdOutlineHouse, MdOutlineCancel } from 'react-icons/md';
const links = [
    {
        title: 'Dashboard',
        links: [
            {
                name: 'Home',
                icon: <MdOutlineHouse />,
            },
        ],
    },
    {
        title: 'Foods',
        links: [
            {
                name: 'Meat',
                icon: <TbMeat />,
            },
        ],
    },
    {
        title: 'Drinks',
        links: [
            {
                name: 'Beer',
                icon: <FaBeer />,
            },
        ],
    },
]

const Sidebar  = () => {
    const { sideMenu, setSideMenu } = useStateContext();
    const activeLink = 'flex items-center gap-5 pl-4 pt-3 pb-2.5 rounded-lg text-black text-md m-2';
    const normalLink = 'flex items-center gap-5 pl-4 pt-3 pb-2.5 rounded-lg text-gray-700 text-md hover:bg-tertiary cursor-pointer';
    const closeSideBar = () => {
        setSideMenu(false);
    }
    return (
        <div className='h-screen shadow-xl px-2
                        md:overflow-hidden overflow-auto 
                        md:hover:overflow-auto pb-10'>
            <div className='flex'>
                <h1 className='border-b-4 border-slate-900 text-2xl p-3'>Krumpn N Da Kitchen {sideMenu}</h1>
                <button type='button' 
                        className='absolute right-1 rounded-full p-2 hover:bg-tertiary text-xl'
                        onClick={closeSideBar}><MdOutlineCancel /></button>
            </div>
            {links.map((item) => (
                <div key={item.title}>
                    <p className='text-gray-800 m-3 mt-4 uppercase'>
                        {item.title}
                    </p>
                    {item.links.map((link) => (
                        <a key={link.name} className={normalLink}>{link.icon} {link.name}</a>
                    ))}
                </div>
            ))
            }
        </div>
    )
};

export default Sidebar;