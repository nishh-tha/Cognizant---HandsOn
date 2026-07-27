import React, { Component } from "react";

class App extends Component {
  constructor() {
    super();

    this.state = {
      count: 0,
      rupees: "",
      euro: "",
    };
  }

  increment = () => {
    this.setState({ count: this.state.count + 1 });
  };

  decrement = () => {
    this.setState({ count: this.state.count - 1 });
  };

  sayHello = () => {
    alert("Hello! Have a nice day.");
  };

  increase = () => {
    this.increment();
    this.sayHello();
  };

  sayWelcome = (message) => {
    alert(message);
  };

  syntheticEvent = () => {
    alert("I was clicked");
  };

  handleChange = (event) => {
    this.setState({ rupees: event.target.value });
  };

  handleSubmit = () => {
    const euro = (this.state.rupees / 90).toFixed(2);
    this.setState({ euro: euro });
  };

  render() {
    return (
      <div style={{ padding: "20px" }}>
        <h1>Event Examples App</h1>

        <h2>Counter: {this.state.count}</h2>

        <button onClick={this.increase}>Increment</button>

        <button onClick={this.decrement}>Decrement</button>

        <br />
        <br />

        <button onClick={() => this.sayWelcome("Welcome")}>
          Say Welcome
        </button>

        <br />
        <br />

        <button onClick={this.syntheticEvent}>
          OnPress
        </button>

        <hr />

        <h2>Currency Converter</h2>

        <input
          type="number"
          placeholder="Enter INR"
          value={this.state.rupees}
          onChange={this.handleChange}
        />

        <button onClick={this.handleSubmit}>
          Convert
        </button>

        <h3>Euro: €{this.state.euro}</h3>
      </div>
    );
  }
}

export default App;