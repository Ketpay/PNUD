 
import url from '../../constants/constants.js' 
 

import React from "react";
import { useState } from "react";
import axios from "axios";
import "../../assets/styles/style.css"
const Actualizarcsv1 = ({dataFromParent}) => {
   
  const [post, setPost] = useState({
    title: "",
    file: null,
  });

  const handleSubmit = async (e) => {
   
    e.preventDefault();
    const formData = new FormData();
    for (let i = 0; i < post.file.length; i++) {
      let w=i+1
      formData.append("file_"+w, post.file[i]);
    }
    // formData.append("file", post.file);
    formData.append("nombre", dataFromParent);

    const response = await axios.post(
      url+'/actualizar/add/archivos/',
      formData,
      {
        headers: {
          "Content-Type": "multipart/form-data",
          "Authorization": "token a5eece1a1bb0dcf21540c6f573f9c264ab6abfb5"
        },
      }
    );

    // console.log(response.status);
    if (response.status===200){
    
    let response= document.getElementById("respuesta")
    response.innerHTML="Creado Exitosamente"
    response.style.color = "#77bf2b";
    //  document.getElementById("data1").value=" ";
    //  document.getElementById("data2").value=" ";
    // this.props.regreso2.mostrarData2("1");
 
    }
    else{
      let response= document.getElementById("respuesta")
      response.innerHTML="Error al subir los datos"
    response.style.color = "#de3333";
    }
  };
  return (
    <div>
      <h2 className="text_center">Subir archivos para {dataFromParent} :</h2>
      <form onSubmit={handleSubmit}>
      <br></br><br></br>
        <input
        multiple
          type="file"
          name="file"
          className="text_center"
          onChange={(e) => {
            console.log(e.target.files)
            setPost({ ...post, file: e.target.files ,});
          }}
        />
        <br></br><br></br>
        <button  class="btn btn-dark text_center" id ="file" >Subir</button>
      
      </form>
      <p id="respuesta" className='titulo_nombre3'></p>
    </div>
  );
};

export default Actualizarcsv1;