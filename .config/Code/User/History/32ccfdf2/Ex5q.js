import { Component, useState } from "@odoo/owl";
import { Counter } from "@awesome_owl/counter/counter";

export class Playground extends Component {
  static template = "awesome_owl.playground";
  static components = { Counter };
  setup() {
    this.state = useState({ value: 0 });
  }

  increment() {
    this.state.value++;
  }
}
