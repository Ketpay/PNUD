  
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
 

async enviar(){
  let val1= document.getElementById("data1").value
  let val2= document.getElementById("data2").value
  // console.log(val1)
  // console.log(val2)
  const options_url = {
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "token f5ce280052c99c4926e711ccd02022eb3dac4800"
    }
  };
const res = await  axios.post(url+'/add/form_1/', {
anio:val1,
dato:val2,
nombre:this.props.data
},options_url)
let datos=res.data;
// console.log(datos);

if (datos.value==="Correcto"){
  let table = document.getElementById("info");
  
  let row = table.insertRow(1);
  let cell = row.insertCell(0);
  cell.innerHTML =val1;
  cell.style.textAlign = "center"; 
  let cel2 = row.insertCell(1);
  cel2.innerHTML = val2;
  cel2.style.textAlign = "center"; 
 
let response= document.getElementById("respuesta")
response.innerHTML="Creado Exitosamente"
response.style.color = "#77bf2b";
 document.getElementById("data1").value=" ";
 document.getElementById("data2").value=" ";
}
else{
  let response= document.getElementById("respuesta")
  response.innerHTML="Error al subir los datos"
response.style.color = "#de3333";
}

}
  render() {
 
    return (
      <div>
 
 

     
<table className="select_center">

<tr>
    <td>Año:</td>
    <td><input type="text" class="form-control form_center"   id="data1"  onKeyPress={(event) => {
        if (!/[0-9]/.test(event.key)) {
          event.preventDefault();
        }
      }}/></td>
</tr>
<tr>
    <td id="val"></td>
    <td><input type="text" class="form-control form_center"  id="data2"   onKeyPress={(event) => {
        if (!/^(\-)?([0-9]{1,})?(\.)?([0-9]{1,})?$/.test(event.key)) {
          event.preventDefault();
        }
      }}/></td>
</tr>
 
<tr>
    <td> </td>
    <td><button type="button" class="btn btn-dark" onClick={this.enviar.bind(this)}>Agregar</button></td>
</tr>
</table>
<p id="respuesta"></p>

      </div>





    )
  }
}
export { Formulario2 }; 