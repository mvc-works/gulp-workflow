
require 'shelljs/make'
fs = require 'fs'
browserify = require 'browserify'

{renderer} = require 'cirru-html'

station = undefined

reload = ->
  station?.reload 'repo/three'

target.cirru = ->
  file = 'cirru/index.cirru'
  render = renderer (cat file), '@filename': file
  render().to 'index.html'
  do reload

target.watch = ->
  fs.watch 'cirru/', interval: 200, target.reload
  fs.watch 'js/', interval: 200, target.browserify
  exec 'coffee -o js/ -wbc coffee/', async: yes

  station = require 'devtools-reloader-station'
  station.start()

target.browserify = ->
    b = browserify ['./js/main']
    build = fs.createWriteStream 'build/build.js', 'utf8'
    bundle = b.bundle(debug: yes)
    bundle.pipe build
    bundle.on 'end', reload