# Main app frame.

{createElement: ce, DOM: d} = require 'react'
{Link} = require 'react-router'

s = require './style'

module.exports = ({children}) ->
  d.main className: s.content,
    d.nav className: s.navbar,
      d.aside className: s.brand,
        ce Link, to: '/', 'niji'
      d.ul className: s.navMenu,
        d.li null, ce Link, to: '/404', '404 link'
    children
