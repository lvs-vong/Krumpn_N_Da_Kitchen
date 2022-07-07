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
