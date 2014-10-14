
Workflow
------

Gulpfile for personal developing. More details to be found here:
https://github.com/mvc-works/workflow

### Dependencies

This is mainly based on:

* Chrome: live reload CSS/JavaScript
* Node, Browserify: packing code
* Gulp: the whole workflow
* CoffeeScript: no need to say
* Cirru HTML: I use Cirru instead of Jade, both are simple

### Commands

Create project file structure:

```
npm i
gulp folder
```

Compile:

```
gulp dev
gulp watch
```

Build code before deploying:

```
gulp build
```

Upload to server:

```
gulp sync
```

### File structure

Filenames are easy to be recognized, here are the folders:

```sh
build/ # temporary compiled code be before built into dist/
cirru/ # for building index.html
coffee/ # source files
css/ # this directory are to be loaded in Chrome workspace
dist/ # built resources for deploying
```

### License

MIT