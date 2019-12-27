// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { Component } from 'react'
import PropTypes from 'prop-types'
import ReactDOM from 'react-dom'
import "core-js"


export default class Hello extends Component {
  constructor(props){
    super(props);
    this.state = {
      name: this.props.name,
    }
  }
  render(){
    return(
      <React.Fragment>
        <div className="container-fluid jumbotron display-3">
          Hello {this.state.name}
        </div>
      </React.Fragment>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('HelloWorld')
  const data = JSON.parse(node.getAttribute('data'))

  ReactDOM.render(
    <Hello name="React" />,
    node.appendChild(document.createElement('div')),
    )
})
