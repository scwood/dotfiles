const backgroundColor = '#1D1F21';

module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 13,

    lineHeight: 33,

    // font family with optional fallbacks
    fontFamily: 'Inconsolata, monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#c5c8c6',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // color of the text
    foregroundColor: '#C5C8C6',

    // terminal background color
    backgroundColor,

    // border color (window, tabs)
    borderColor: '#282a2e',

    // custom css to embed in the main window
    css: `
      .tabs_list {
        background-color: #181a1b !important;
      }
      .tab_tab.tab_active {
        font-weight: 600;
        background-color: ${backgroundColor};
      }
      .tab_tab.tab_active::before {
        border-bottom-color: ${backgroundColor};
      }
    `,

    // custom css to embed in the terminal window
    termCSS: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#2d3c46',
      red: '#a54242',
      green: '#8c9440',
      yellow: '#de935f',
      blue: '#5f819d',
      magenta: '#85678f',
      cyan: '#5e8d87',
      white: '#6c7a80',
      lightBlack: '#425059',
      lightRed: '#cc6666',
      lightGreen: '#b5bd68',
      lightYellow: '#f0c674',
      lightBlue: '#81a2be',
      lightMagenta: '#b294bb',
      lightCyan: '#8abeb7',
      lightWhite: '#c5c8c6'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: ''

    // for advanced config flags please refer to https://hyperterm.org/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyperterm-themed-scrollbar'
  ],

  // in development, you can create a directory under
  // `~/.hyperterm_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
