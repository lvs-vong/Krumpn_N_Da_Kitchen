// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration
module.exports = {
  content: [
    './js/**/*.{js,jsx,ts,tsx}',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex'
  ],
  theme: {
    extend: {
      fontSize: {
        14: '14px',
      },
      fontFamily: {
        osa: ['OSA'],
        eightbit: ['EIGHTBIT'],
      },
      colors: {
        'main': '#00215D',
        'secondary': '#0A1836',
        'tertiary': '#F1F7FC',
        'quaternary': '#3BB7ED',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms')
  ]
}
