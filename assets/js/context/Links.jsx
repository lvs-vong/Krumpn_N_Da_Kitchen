import React from 'react';
import { FaBeer } from 'react-icons/fa';
import { TbMeat } from 'react-icons/tb';
import { MdOutlineHouse} from 'react-icons/md';

export const links = [
    {
        title: 'Dashboard',
        links: [
            {
                name: 'Home',
                icon: <MdOutlineHouse />,
                link: '/home',
            },
        ],
    },
    {
        title: 'Foods',
        links: [
            {
                name: 'Meat',
                icon: <TbMeat />,
                link: '/meat',
            },
        ],
    },
    {
        title: 'Drinks',
        links: [
            {
                name: 'Beer',
                icon: <FaBeer />,
                link: '/beer',
            },
        ],
    },
    
]
