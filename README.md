
mk
------

```bash
alias mk="coffee make.coffee"
```

`mk` is my customized developing tool based on [mission][mission].

[mission]: https://github.com/jiyinyiyong/mission

### Usage

For single-page-apps:

```bash
wget https://raw.githubusercontent.com/jiyinyiyong/mk/master/make.coffee
chmod +x make.coffee
npm init
npm i --save-dev mission shelljs
# and add your customizations
mk compile # build Cirru, CoffeeScript
mk watch # watch reload
mk sync # upload to server
```

[To reload Chrome Tabs, use the extension][reloader].

[reloader]: https://github.com/jiyinyiyong/devtools-reloader-crx

For server-rendered-apps, choose what you want.

### License

MIT