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
        'main': '#77DD77',
        'secondary': '#ADAD89',
        'tertiary': '#68EDCB',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms')
  ]
}
