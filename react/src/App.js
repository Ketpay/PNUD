import React from "react";
import { BrowserRouter, Route ,Routes} from 'react-router-dom';
import  {Inicio} from './pages/inicio.js'
import  {Metas} from './pages/metas.js'
import  {Actualizar} from './pages/actualizar.js'
import {Navbar} from './components/navbar/navbar.js'
function App() {
  return (
    <div >
      <BrowserRouter>
    {/* RUTAS DEL NAVBAR */}
    <Routes>
      <Route exact path="/" element={<Navbar/> } />
      <Route exact path="/metas" element={<Navbar/> } />
      <Route exact path="/actualizar" element={<Navbar/> } />
 
      <Route path="*" element={<Navbar/>} />
    </Routes>
   {/* RUTAS DEL CONTENIDO */}
      <Routes>
      <Route exact path="/" element={<Inicio/>} />
      <Route exact path="/metas" element={<Metas/>} />
      <Route exact path="/actualizar" element={<Actualizar/>} />
     
      <Route path="*" element={<div><h1>No encontro Pagina</h1></div>} />
    </Routes>
 
   
  </BrowserRouter>
    </div>
  );
}

export default App;
