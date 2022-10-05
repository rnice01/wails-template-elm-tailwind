import { Elm } from '../Main.elm'

const app = Elm.Main.init({ node: document.getElementById("elm") })


app.ports.sendGreetRequest.subscribe(function (name) {
  window.go.main.App.Greet(name)
  .then(result => app.ports.greetReceiver.send(result))
})
