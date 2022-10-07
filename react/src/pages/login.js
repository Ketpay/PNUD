 
import url from '../constants/constants.js' 
 

import React from 'react'
 
import axios from 'axios'
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import '../assets/styles/style.css'
import background from "../assets/img/fondo.jpg";



class Login extends React.Component {
  
    constructor(props){
        super(props)
        this.state = {
          
        }
      }
      handleKeyPress = (event) => {
        if(event.key === 'Enter'){
           
            this.enviar();
        }
      }
    //   async getOptions(){ 
    // let data=this.props.dataFromParent
    // // console.log(data)
    // let form1=document.getElementById("val");
    // form1.innerHTML=data[2]+":"
    // let form2=document.getElementById("val2");
    // form2.innerHTML=data[3]+":"
    //   }
    //   componentDidMount(){
    //     this.getOptions()
    // }
   
    
    async enviar(){
      let val1= document.getElementById("user_name").value
      let val2= document.getElementById("password_name").value
 
 
      const options_url = {
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "token a5eece1a1bb0dcf21540c6f573f9c264ab6abfb5"
        }
      };
    const res = await  axios.post(url+'/login_web/', {
        usuario:val1,
        password:val2,
 
    },options_url)
    let datos=res.data;
    // console.log(datos);
    
    if (datos.value==="correcto"){
        window.location.href = './inicio';
    }
   
    
    }

render() { 
    return (
        <div 
        style={{ 
            backgroundImage: `url(${background})`,
            backgroundPosition: 'center',
            backgroundSize: 'cover',
            backgroundRepeat: 'no-repeat',
            width: '100vw',
            height: '100vh'
          }} className='backgroundLogin'
          >
    <div className='login'>
       <h2 className='titulo_nombre2' >PNUD</h2> 
  <Form>
  
      <Form.Group className="mb-3" controlId="formBasicEmail">
        <Form.Label>Usuario :</Form.Label>
        <Form.Control type="text" id="user_name" name="username" placeholder="Ingresar usuario" onKeyPress={this.handleKeyPress}/>
        
      </Form.Group>

      <Form.Group className="mb-3" controlId="formBasicPassword">
        <Form.Label>Contraseña :</Form.Label>
        <Form.Control type="password" id="password_name" name="password" placeholder="Ingresar contraseña" onKeyPress={this.handleKeyPress}/>
      </Form.Group>
      <Form.Group className="mb-3" controlId="formBasicCheckbox">
      
      </Form.Group>
      
    </Form>
 
    <Button variant="dark" className='ingresar' type="submit" id="send" 
    onClick={this.enviar.bind(this)}
    >
        Ingresar
      </Button>
    </div>
    </div>
    )
}
}

export { Login };  