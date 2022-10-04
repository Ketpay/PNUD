 
import url from '../../constants/constants.js' 
 

import React, { Component } from 'react'
import Select from 'react-select'
import axios from 'axios'

class Search2 extends Component {

  constructor(props){
    super(props)
    this.state = {
      selectOptions : [],
      id: "",
      name: ''
    }
  }

 async getOptions(){
    const options_url = {
            headers: {
              'Content-Type': 'application/json',
              "Authorization": "token a5eece1a1bb0dcf21540c6f573f9c264ab6abfb5"
            }
          };
    const res = await axios.post(url+'/buscar/capas/', {
    dato:this.props.dataFromParent
  },options_url)
    const options = res.data
    
    this.setState({selectOptions: options})

  }

  handleChange(e){
   this.setState({id:e.value, name:e.label})
   this.props.regreso.mostrarData(e.label)
  }

  componentDidMount(){
      this.getOptions()
  }

  render() {
    // console.log(this.state.selectOptions)
    return (
      <div>
          <h4 className="select_center">{this.props.dataFromParent} :</h4>
        <Select options={this.state.selectOptions}  className="select_center" onChange={this.handleChange.bind(this)} />
   
      </div>
    )
  }
}
export { Search2 }; 