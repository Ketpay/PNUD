 
import url from '../constants/constants.js' 
 

import React, { Component } from 'react'
import Select from 'react-select'
import axios from 'axios'
import { Search } from '../components/seacrh_metas/search.js'
import { Search2 } from '../components/seacrh_metas/search2.js'
import  Actualizarcsv1  from '../components/formulario_actualizar/actualizarcsv1.js'
import  Actualizarcsv2  from '../components/formulario_actualizar/actualizarcsv2.js'
import { Metadatos } from '../components/meta_datos/metadatos.js'
import { Metadatos2 } from '../components/meta_datos/metadatos2.js'
import '../assets/styles/style.css'
import {Actuacsvpag} from "../components/paginas_data/actualizarcsvpagina.js"
class Actualizarcsv extends Component {

  constructor(props){
    super(props)
    this.state = {
      selectOptions : [],
      id: "",
      n:2,
      name: '',
      dato:'',
      dato2:'',
      mostrar:2,
      mostrar2:2,
     
    }
  }

 async getOptions(){
    const options_url = {
            headers: {
              'Content-Type': 'application/json',
              "Authorization": "token a5eece1a1bb0dcf21540c6f573f9c264ab6abfb5"
            }
          };
    const res = await axios.get(url+'/metas/buscar/submetas/' ,options_url)
    const options = res.data
  
    this.setState({selectOptions: options})

  }

  handleChange(e){
    this.setState({mostrar:2 })
   this.setState({id:e.value, name:e.label })
   
   if(this.state.n ===0){
    this.setState({n:1 })
   }
   else if(this.state.n ===1){
    this.setState({n:0 })
   }
   else{
    this.setState({n:0 })
   }
  //  console.log(this.state.n);
  }

  componentDidMount(){
      this.getOptions()
  }


  mostrarData(e){
    this.setState({dato:e })
    // console.log("llego")
    // console.log(e)
    // this.setState({mostrar:1 })
    this.setState({mostrar2:2 })
    if(this.state.mostrar ===0){
      this.setState({mostrar:1 })
     }
     else if(this.state.mostrar ===1){
       
      this.setState({mostrar:0 })
     }
     else{
      this.setState({mostrar:0 })
     }
    //  console.log(this.state.mostrar)
  }

  // mostrarData2(e){
  //   this.setState({dato2:e })
  //   // console.log("llego")
  //   console.log("regreso")
  //   console.log(e)
  //   // this.setState({mostrar:1 })
  //   if (e==="1"){


    
  //   if(this.state.mostrar2 ===0){
  //     this.setState({mostrar2:1 })
  //    }
  //    else if(this.state.mostrar2 ===1){
       
  //     this.setState({mostrar2:0 })
  //    }
  //    else{
  //     this.setState({mostrar2:0 })
  //    }
  //   }
  //   else{
  //     this.setState({mostrar2:0 })
  //    }
  //   //  console.log(this.state.mostrar)
  // }


  render() {
    // console.log(this.state.selectOptions)
    return (
      <div>
        <div className="container">
        <div className="item-left">
        <h4 className="select_center">Agregar data en :</h4>
        <Select className="select_center" options={this.state.selectOptions} onChange={this.handleChange.bind(this)} />

        </div>
        <div className="item-right">
        {this.state.n === 0 && <Search  dataFromParent = {this.state.name} regreso={{mostrarData:this.mostrarData.bind(this)}} />}
        {this.state.n === 1 && <Search2  dataFromParent = {this.state.name} regreso={{mostrarData:this.mostrarData.bind(this)}} />}
      
       
        </div>
        </div>
        
        {this.state.mostrar === 2 && <Actuacsvpag/>}
   {this.state.mostrar === 0 && <Actualizarcsv1  dataFromParent = {this.state.dato}
    // regreso2={{mostrarData2:this.mostrarData2.bind(this)}}
     />}
   {this.state.mostrar === 1 && <Actualizarcsv2  dataFromParent = {this.state.dato} 
  //  regreso2={{mostrarData2:this.mostrarData2.bind(this)}}
    />}
 
   {/* {this.state.mostrar2 === 1 && <Metadatos  dataFromParent = {this.state.dato}  />}
   {this.state.mostrar2 === 0 && <Metadatos2  dataFromParent = {this.state.dato}  />} */}
      </div>
    )
  }
}
export { Actualizarcsv }; 