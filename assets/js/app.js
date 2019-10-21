// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

import {Socket} from "phoenix"
import LiveSocket from "phoenix_live_view"

let Hooks = {}
Hooks.Todo = {
  mounted() {
    this.el.addEventListener("dblclick", e => {
      const toggle = this.el.querySelector(".toggle")

      this.pushEvent("edit", {
        "todo-id": toggle.getAttribute("phx-value-todo-id")
      })
    })
  },
  updated() {
    const edit = this.el.querySelector(".edit")
    edit.focus()
    edit.setSelectionRange(edit.value.length, edit.value.length);
  }
}

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: Hooks
})
liveSocket.connect()
