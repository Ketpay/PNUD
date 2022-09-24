  
import url from '../../constants/constants.js' 
import axios from 'axios'

import React, { Component } from 'react'
 
class Formulario3 extends Component {
  
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
    let form2=document.getElementById("val2");
    form2.innerHTML=data[3]+":"
      }
      componentDidMount(){
        this.getOptions()
    }
     
  render() {
 
    return (
      <div>
 
 

 <table className="select_center">

<tr>
    <td>Año:</td>
    <td><input type="text" class="form-control form_center"    /></td>
</tr>

<tr>
    <td id="val"> </td>
    <td><input type="text" class="form-control form_center"    /></td>
</tr>
<tr>
    <td id="val2"> </td>
    <td><input type="text" class="form-control form_center"    /></td>
</tr>
<tr>
    <td> </td>
    <td><button type="button" class="btn btn-dark">Agregar</button></td>
</tr>
</table>

      </div>





    )
  }
}
export { Formulario3 }; 