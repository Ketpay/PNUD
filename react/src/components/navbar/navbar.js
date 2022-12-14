import React  from "react";
import { Link } from "react-router-dom";
import{ Navbar, Nav ,NavDropdown}  from "react-bootstrap";
class Navbarweb extends React.Component {
 
render() { 
    return (
    <div>

<Navbar collapseOnSelect expand="lg" bg="dark" variant="dark">
  <Navbar.Brand  >
  <Link to="/inicio" className="navbar-brand titulo_nombre">&nbsp;Índice de salud de los océanos </Link>
  </Navbar.Brand>
  <Navbar.Toggle aria-controls="responsive-navbar-nav " />
  <Navbar.Collapse id="responsive-navbar-nav">
    <Nav className="navbar-nav ms-auto mb-2 mb-lg-0">
      <Nav.Link ><Link to="/inicio" className="nav-link"> &nbsp;&nbsp;Inicio </Link></Nav.Link>
      <Nav.Link  ><Link to="/metas/" className="nav-link">&nbsp;&nbsp;Metas</Link></Nav.Link>
      {/* <Nav.Link  ><Link to="/actualizar/" className="nav-link">&nbsp;&nbsp;Actualizar</Link></Nav.Link> */}

      <Nav.Link  ><NavDropdown title="Actualizar" id="collasible-nav-dropdown">
      <Link to="/actualizar/" className="nav-link">  <NavDropdown.Item href="/actualizar/">Manual</NavDropdown.Item></Link>
      <Link to="/actualizar/auto/" className="nav-link">  <NavDropdown.Item href="/actualizarcsv/">Automatico</NavDropdown.Item></Link>
        
    
      </NavDropdown></Nav.Link>
      <Nav.Link ><Link to="#" className="nav-link">  Dashboars </Link></Nav.Link>
      <Nav.Link ><Link to="/" className="nav-link"> &nbsp;&nbsp;Salir &nbsp;&nbsp;</Link></Nav.Link>
      
    </Nav>
    {/* <Nav> */}
      {/* <Nav.Link href="#deets">More deets</Nav.Link>
      <Nav.Link eventKey={2} href="#memes">
        Dank memes
      </Nav.Link> */}
    {/* </Nav> */}
  </Navbar.Collapse>
</Navbar>


{/* 
<nav className="navbar navbar-expand-lg navbar-dark bg-dark">
<div className="container-fluid">
<Link to="/" className="navbar-brand"> PNUD </Link>
  <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span className="navbar-toggler-icon"></span>
  </button>
  <div className="collapse navbar-collapse" id="navbarSupportedContent">
    <ul className="navbar-nav ms-auto mb-2 mb-lg-0">
      <li className="nav-item">
      <Link to="/" className="nav-link"> Inicio </Link>
      </li>
      <li className="nav-item">
      <Link to="/metas/" className="nav-link">Metas</Link>
      </li>
      <li className="nav-item">
      <Link to="/actualizar/" className="nav-link">Actualizar</Link>
      </li>
      
    </ul>
   
  </div>
</div>
</nav> */}
    </div>
    )
}
}

export { Navbarweb }; 