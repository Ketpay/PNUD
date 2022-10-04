 
import url from '../constants/constants.js' 
 

import React from 'react'
import Select from 'react-select'
import axios from 'axios'
import ProgressBar from 'react-bootstrap/ProgressBar';
class Inicio extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      selectOptions : [],
      id: "",
      n:2,
      name: '',
      dato:'',
      mostrar:0,
     
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
    console.log(options)
    this.setState({selectOptions: options})

  }
  componentDidMount(){
    this.getOptions()
}
handleChange(e){
 
 this.setState({id:e.value, name:e.label })
 
}
render() { 
    return (
    <div>
  <h2 className="text_inicio">Bienvenidos a PNUD</h2> 

<p className="text_inicio">Aqui puedes buscar los resultados obtenidos</p>


<Select className="select_inicio" options={this.state.selectOptions} onChange={this.handleChange.bind(this)} />
 
<div className="container">
        <div className="item-left">
        Score TOTAL :90%

        </div>
        <div className="item-right">
        <ProgressBar now={90}  label={`90%`} animated  />
        </div>
        </div>
 
 
 
 
        <div className="container_inicio">
             <div className="item-1">
             <table class="default">
  <tr>
    <th>Elemento</th>
    <th>Porcentaje</th>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={25}  label={`25%`} animated  variant="success"/> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={30}  label={`30%`} animated  variant="success"/> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={40}  label={`40%`} animated  variant="success"/> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={40}  label={`40%`} animated  variant="success"/> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={50}  label={`50%`} animated  variant="success"/> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={50}  label={`50%`} animated  variant="success"/> </td>
  </tr>
</table>
               </div>
             <div className="item-2">
             <table class="default">
  <tr>
    <th>Elemento</th>
    <th>Porcentaje</th>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={45}  label={`45%`} animated  variant="info"/> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={5}  label={`5%`} animated  variant="info"/> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={75}  label={`75%`} animated variant="info" /> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={75}  label={`75%`} animated variant="info" /> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={90}  label={`90%`} animated variant="info" /> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={10}  label={`10%`} animated  variant="info"/> </td>
  </tr>
</table>
               </div>
             <div className="item-3">
             <table class="default">
  <tr>
    <th>Elemento</th>
    <th>Porcentaje</th>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={10}  label={`10%`} animated variant="warning" /> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={60}  label={`60%`} animated  variant="warning"/> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={80}  label={`80%`} animated  variant="warning"/> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={70}  label={`70%`} animated variant="warning" /> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={42}  label={`42%`} animated variant="warning" /> </td>
  </tr>
  <tr>
    <td>Dato :</td>
    <td className='large'><ProgressBar now={10}  label={`10%`} animated  variant="warning"/> </td>
  </tr>
</table>
               </div>
           </div>
    </div>
    )
}
}

export { Inicio }; 