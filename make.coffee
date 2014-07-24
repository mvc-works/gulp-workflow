#!/usr/bin/env coffee
project = 'her-files'

require 'shelljs/make'
path = require 'path'
mission = require 'mission'

mission.time()

target.folder = ->
  mission.tree
    '.gitignore': ''
    'README.md': ''
    js: {}
    build: {}
    cirru: {'index.cirru': ''}
    coffee: {'main.coffee': ''}
    css:
      'style.css': ''
      'dev.css': ''
      'build.css': ''

target.coffee = ->
  mission.coffee
    find: /\.coffee$/, from: 'coffee/', to: 'js/', extname: '.js'
    options:
      bare: yes

cirru = (data) ->
  mission.cirruHtml
    file: 'index.cirru'
    from: 'cirru/'
    to: './'
    extname: '.html'
    data: data

browserify = (callback) ->
  mission.browserify
    file: 'main.js'
    from: 'js/'
    to: 'build/'
    done: callback
    options:
      external: ['react', 'react-router']

browserifyVender = ->
  mission.browserifyVender
    files: ['react', 'react-router']
    to: 'build/vender.js'

target.cirru = -> cirru inDev: yes
target.cirruBuild = -> cirru inBuild: yes
target.browserify = -> browserify()
target.browserifyVender = -> browserifyVender()

target.dev = ->
  cirru inDev: yes
  target.coffee yes
  browserifyVender()
  browserify()

target.build = ->
  cirru inBuild: yes
  target.coffee yes
  browserifyVender()
  browserify()

target.watch = ->
  station = mission.reload()

  mission.watch
    files: ['cirru/', 'coffee/']
    trigger: (filepath, extname) ->
      switch extname
        when '.cirru'
          cirru inDev: yes
          station.reload "repo/ #{project}"
        when '.coffee'
          filepath = path.relative 'coffee/', filepath
          mission.coffee
            file: filepath, from: 'coffee/', to: 'js/', extname: '.js'
            options:
              bare: yes
          browserify ->
            station.reload project

target.patch = ->
  mission.bump
    file: 'package.json'
    options:
      at: 'patch'

target.rsync = ->
  target.build()
  mission.rsync
    file: './'
    dest: "tiye:~/repo/#{project}"
    options:
      exclude: [
        'node_modules/'
        'bower_components/'
        'coffee'
        'README.md'
        'js'
        '.git/'
        'png/*.jpg'
      ]