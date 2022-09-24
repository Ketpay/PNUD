  
import url from '../../constants/constants.js' 
import axios from 'axios'

import React, { Component } from 'react'
 
class Formulario2 extends Component {
  
  constructor(props){
    super(props)
    this.state = {
      
    }
  }

  async getOptions(){ 
let data=this.props.dataFromParent
// console.log(data)
let form1=document.getElementById("val");
form1.innerHTML=data[2]+":"
  }
  componentDidMount(){
    this.getOptions()
}
 

enviar(){
  let val1= document.getElementById("data1")
  let val2= document.getElementById("data2")
  const options_url = {
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "token f5ce280052c99c4926e711ccd02022eb3dac4800"
    }
  };
const res =   axios.post(url+'/buscar/submetas/', {
anio:val1,
dato:val2
},options_url)
const options = res.data

this.setState({selectOptions: options})

}
  render() {
 
    return (
      <div>
 
 

     
<table className="select_center">

<tr>
    <td>Año:</td>
    <td><input type="text" class="form-control form_center"   id="data1" /></td>
</tr>
<tr>
    <td id="val"></td>
    <td><input type="text" class="form-control form_center"  id="data2"  /></td>
</tr>
 
<tr>
    <td> </td>
    <td><button type="button" class="btn btn-dark" onClick={this.enviar.bind(this)}>Agregar</button></td>
</tr>
</table>


      </div>





    )
  }
}
export { Formulario2 }; 