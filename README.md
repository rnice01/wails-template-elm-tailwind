# README
Create Wails apps with the power :msucle: of Elm and the beauty :sparkles: of Tailwind CSS!

<br />

## Using this template for your next Wails project!

Run the following command:

```
wails init -n wails-hello-world -t https://github.com/rnice01/wails-template-elm-tailwind
```

## About
This Wails Template is intended to help you get started creating your next Wails app using Elm and Tailwind CSS. Firstly, be sure to take a look at the `frontend/src/package.json` to see what dependencies will be installed.

I've tried to keep this to a minimum. But Elm needs to use ports in order to call the Go functions for your Wails backend. Which isn't a big deal, you can inline all the ports in the `index.html` where you init the Elm app. Or have separate JS files that are loaded after the main.js that add ports.

But I like using modules, so I ended up using Webpack.

---
<br/>

## Maybe Useful Tidbits

:shrug:

<br/>

### `package.json`

There's a few simple scripts here. The gist is Webpack is used to handle any `.js` or `.elm` files and the Tailwind CLI handles
all the CSS. When running `wails dev` Webpack and the Tailwind CLI go into watch mode, `webpack:dev` and `tailwind:dev` are run.

Alternatively, `wails build` will run `webpack:prod` and `tailwind:prod`.

<br />

### `frontend/src/Main.elm`

This is the main (hence the name) development area for the frontend area of the app. The "glue" part to hook up Wails to Elm are through
ports. The Greet example can be found in `frontend/src/js/app.js`. This is where I have it configured to initialize the Elm app and add ports
to allow Elm to reach out into the JS world in order to invoke Go functions and then recieve data back.

<br />

### `frontend/src/assets/main.css`

This is just a requirement for Tailwind CSS. The way Tailwind knows which styles to add to the `dist/main.css` is by looking through
any files that end with `.elm` in `frontend/src/`. 

This is configured in `frontend/src/tailwind.config.js`. So if you're wanting to move stuff around, be sure to update that file if you find yourself adding classes to your Elm files and are not seeing the expected style changes.

This file gets copied over to `frontend/dist/assets` but it's not required, I just have a script in `package.json` that recursively copies everything from `frontend/src/assets` to `frontend/dist/assets` when Wails starts up, and I'm too lazy to try to figure out how to exclude that one file.

___
<br />

## Live Development

To run in live development mode, run `wails dev` in the project directory.

That's it! Enjoy hot reloading with Elm and TailwindCSS!

**Note:** The frontend/src/assets folder only gets copied once, when the dev server starts. I personally didn't need it
to auto sync, since I don't change fonts/images often. There are some good options on [npmjs](npmjs.com) for having the assets folder "watched"
if you want it to behave like the Elm and CSS changes.

___
<br />

## Building

To build a redistributable, production mode package, use `wails build`.


---
All feedback (create an issue) and PRs are welcome!

お願いします！ :bow: