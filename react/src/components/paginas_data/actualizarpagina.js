 
 

import React from 'react'
 
 
 
import '../../assets/styles/style.css'
import Data from '../../assets/img/actualizar.jpg';
class Actuapag extends React.Component {
  
    

render() { 
    return (
 
      <div  >
      <div className="container">
          <div className="item-left">
        <h4 style={{textAlign: "justify" }}>Aquí podrás actualizar la data de PNUD.</h4>
        <h6 style={{textAlign: "justify" }}>Busca la submeta que deseas actualizar y llena el formulatio...</h6>
         
          </div>
          <div className="item-right">
          <img src={Data} alt="Data" width="600" style={{border: "5px solid #555" }}/>
          </div>
          </div>
      </div>
    )
}
}

export { Actuapag };  