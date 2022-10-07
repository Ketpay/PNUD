 

import React from 'react'
 
 
 
import '../../assets/styles/style.css'
import Data from '../../assets/img/metas.jpg';
 
class Metapag extends React.Component {
  
    

render() { 
    return (
 
    <div  >
    <div className="container">
        <div className="item-left">
      <h4 style={{textAlign: "justify" }}>Aquí podrás ver la data de nuestras diferentes metas y sub metas.</h4>
      <h6 style={{textAlign: "justify" }}>Encontraras Graficos de Barras y de lineas con la informacion Historica del PNUD.</h6>
       
        </div>
        <div className="item-right">
        <img src={Data} alt="Data" width="600" style={{border: "5px solid #555" }}/>
        </div>
        </div>
    </div>
    )
}
}

export { Metapag };  