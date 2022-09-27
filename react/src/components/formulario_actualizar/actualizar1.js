 
import url from '../../constants/constants.js' 
import axios from 'axios'

import React, { Component } from 'react'
import {Formulario3} from './formulario3'
import {Formulario2} from './formulario2'
class Actualizar1 extends Component {
  
  constructor(props){
    super(props)
    this.state = {
      selectOptions : [],
      id: "",
      name: '',
      mostrar_formulario:2,
      fields:"",
    }
  }

  
  async getOptions(){
    const options_url = {
            headers: {
              'Content-Type': 'application/json',
              "Authorization": "token f5ce280052c99c4926e711ccd02022eb3dac4800"
            }
          };
    const res = await axios.post(url+'/view/meta/data/', {
    dato:this.props.dataFromParent
  },options_url)
    // const options = res.data
    // console.log(options)
    
    let datos=res.data;

    this.setState({barras:datos.barra })
    this.setState({fields:datos.fields })
    // console.log("-----")
    // console.log(datos.fields)
    if (datos.fields.length===3){
      this.setState({mostrar_formulario:0})
    }
    else{
      this.setState({mostrar_formulario:1})
    }
    let table = document.getElementById("info");
    let numberOfrows = document.getElementById("info").rows.length;

    let array_dato=datos.datos;
    if (numberOfrows>1) {
      for (let i = 0; i < numberOfrows-1; i++) {
      table.deleteRow(1); 
    }}  
    



    // for (let y = 0; y < datos.col-1; y++) {
    
      let headers=datos.fields
      let row = table.insertRow(0);

      for (let i = 0; i < headers.length-1; i++) {
        
         let cell = row.insertCell(i);
         if (headers[i+1]==="Anio"){
          cell.innerHTML = "Año";
         }
         else{
          cell.innerHTML = headers[i+1];
         }
         
         cell.classList.add("header");
         cell.style.textAlign = "center"; 
          
         

      }
    //  }

    // --------------
    for (let y = 0; y < array_dato.length; y++) {
    
       let info_datos=array_dato[y]
       let row = table.insertRow(1);
 
       for (let i = 0; i < info_datos.length-1; i++) {

          let cell = row.insertCell(i);
          cell.innerHTML = info_datos[i+1];
          cell.style.textAlign = "center"; 

       }
      }
  }
  componentDidMount(){
    this.getOptions()
}
  render() {
 
    return (
      <div>
<div className="container">
        <div className="item-left">

        <h2 className="text_center">Formulario para {this.props.dataFromParent} :</h2>

 
        {this.state.mostrar_formulario === 0 && <Formulario2  dataFromParent = {this.state.fields}  data={this.props.dataFromParent}/>}
   {this.state.mostrar_formulario === 1 && <Formulario3  dataFromParent = {this.state.fields} data={this.props.dataFromParent} />}

   
      </div>
      <div className="item-right">
      <table id="info" className='tabla_info'>
      </table>
        </div>
        </div>






 
 
      </div>





    )
  }
}
export { Actualizar1 }; 