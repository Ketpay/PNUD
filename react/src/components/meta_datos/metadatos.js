 
import url from '../../constants/constants.js' 
 

import React, { Component } from 'react'
// import Select from 'react-select'
import axios from 'axios'
import {Grafico} from "../graficos/grafico.js"
import {Graficobarras} from "../graficos/graficobarras.js"
class Metadatos extends Component {
 
  constructor(props){
    super(props)
    this.state = {
      selectOptions : [],
      barras:2,
 
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
       <h2 className='titulo'>{this.props.dataFromParent}</h2>
       <div className="container">
        <div className="item-left">
      <table id="info" className='tabla_info'>
      </table>
      </div>
      <div className="item-right">

      {this.state.barras === 1 &&  <Graficobarras dataFromParentgrafico = {this.props.dataFromParent}/>}
      {this.state.barras === 0 &&  <Grafico dataFromParentgrafico = {this.props.dataFromParent}/>}
      
        </div>
        </div>
      </div>





    )
  }
}
export { Metadatos }; 