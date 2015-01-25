
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
gulp start
gulp dev # quick compile small part of files
gulp watch # watch compiling
```

Build code before deploying:

```
gulp build
gulp dist # with rev
```

Upload to server with rsync(currently my personal server):

```
gulp up
```

### Alias

Base alias based on my current file structure:

```bash
alias workflow="
cp ~/repo/mvc-works/workflow/{.gitignore,.npmignore,gulpfile.coffee,package.json} ./;
mkdir -p src/;
cp ~/repo/mvc-works/workflow/index.cirru ./;
"
```

### File structure

Filenames are easy to be recognized, here are the folders:

```sh
build/  # a compiled version of site
dist/   # built resources for deploying
src/    # source files in CoffeeScript
lib/    # compiled JavaScript for npm
```

### License

MIT
