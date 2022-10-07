 
import url from '../constants/constants.js' 
 

import React from 'react'
import Select from 'react-select'
import axios from 'axios'
// import ProgressBar from 'react-bootstrap/ProgressBar';
import {Valores} from '../components/valores/valores.js'
 
// import img1 from "../assets/img/img1.jpeg"
// import img2 from "../assets/img/img2.jpeg"
 
class Inicio extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      selectOptions : [],
      dato:"",
      n:2,
     
    }
  }

 async getOptions(){
    const options_url = {
      headers: {
              'Content-Type': 'application/json',
              "Authorization": "token a5eece1a1bb0dcf21540c6f573f9c264ab6abfb5"
            }
          };
    const res = await axios.post(url+'/objetivos/', {
    
  },options_url)
    const options = res.data
 
    this.setState({selectOptions: options})

  }
  componentDidMount(){
    this.getOptions()
}
handleChange(e){
 
 
  this.setState({dato:e.value })
 
 if(this.state.n ===0){
  this.setState({n:1 })
 }
 else if(this.state.n ===1){
  this.setState({n:0 })
 }
 else{
  this.setState({n:0 })
 }
 
}

render() { 
    return (
    <div>
  <h2 className="text_inicio titulo_nombre">Bienvenidos a PNUD</h2> 

<p className="text_inicio">Aqui puedes buscar los resultados obtenidos en ...</p>


<Select className="select_inicio" options={this.state.selectOptions} onChange={this.handleChange.bind(this)} 
defaultValue={{ label: "Nacional", value: 0 }}/>
{this.state.n === 2 && <Valores  dataFromParent = {0} />}
{this.state.n === 1 && <Valores  dataFromParent = {this.state.dato}  />}
   {this.state.n === 0 && <Valores  dataFromParent = {this.state.dato}  />}
 
 

    </div>
    )
}
}

export { Inicio }; 