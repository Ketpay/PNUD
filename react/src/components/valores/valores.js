 
import url from '../../constants/constants.js' 
 

import React from 'react'
// import Select from 'react-select'
import axios from 'axios'
import ProgressBar from 'react-bootstrap/ProgressBar';
import "../../assets/styles/style.css"
import {PopupData} from "../popup_data/popupdata.js"
class Valores extends React.Component {
  constructor(props){
    super(props)
    this.state = {
        d0 : 0,
      d1 : 0,
      d2 : 0,
      d3 : 0,
      d4 : 0,
      d5 : 0,
      d6 : 0,
      d7 : 0,
      d8 : 0,
      d9 : 0,
      d10 : 0,
      d11 : 0,
      d12 : 0,
      d13 : 0,
      d14 : 0,
      d15 : 0,
      d16 : 0,
      d17 : 0,
      d18 : 0,
 
 
     
    }
  }

 async getOptions(){
    const options_url = {
      headers: {
              'Content-Type': 'application/json',
              "Authorization": "token a5eece1a1bb0dcf21540c6f573f9c264ab6abfb5"
            }
          };
    const res = await axios.post(url+'/view/objetivos/', {
        region:this.props.dataFromParent
  },options_url)
    const options = res.data
  
    
    this.setState({
        d0: options.score[0],
        d1 : options.score[1],
        d2 : options.score[2],
        d3 : options.score[3],
        d4 : options.score[4],
        d5 :options.score[5],
        d6 : options.score[6],
        d7 : options.score[7],
        d8 :options.score[8],
        d9 : options.score[9],
        d10 : options.score[10],
        d11 : options.score[11],
        d12 : options.score[12],
        d13 : options.score[13],
        d14 : options.score[14],
        d15 : options.score[15],
        d16 : options.score[16],
        d17 : options.score[17],
        d18 : options.score[18],
    
       
       })
    

  }
  componentDidMount(){
    this.getOptions()
}
 
render() { 
    return (
    <div>
 
<div className="container">
        <div className="item-left2">
       <h3> Score TOTAL : </h3>
     
        </div>
        <div className="item-right2">
        <ProgressBar now={ this.state.d10  }  label={this.state.d10 + ' %'} animated  />
        </div>
        </div>

        <div className="container_inicio">
             <div className="item-1">
             <table class="default">
  <tr>
    <th>Goal</th>
    <th>Score</th>
  </tr>
  <tr>
    <td> <PopupData dataFromParent = "AO" dataFromParent2 = {this.props.dataFromParent} color = "success"/></td>
    <td className='large'><ProgressBar now={this.state.d0}  label={this.state.d0+` %`} animated  variant="success"/> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "BD" dataFromParent2 = {this.props.dataFromParent} color = "success"/></td>
    <td className='large'><ProgressBar now={this.state.d1}  label={this.state.d1+` %`} animated  variant="success"/> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "CP" dataFromParent2 = {this.props.dataFromParent} color = "success"/></td>
    <td className='large'><ProgressBar now={this.state.d2}  label={this.state.d2+` %`} animated  variant="success"/> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "CS" dataFromParent2 = {this.props.dataFromParent} color = "success"/></td>
    <td className='large'><ProgressBar now={this.state.d3}  label={this.state.d3+` %`} animated  variant="success"/> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "CW" dataFromParent2 = {this.props.dataFromParent} color = "success"/></td>
    <td className='large'><ProgressBar now={this.state.d4}  label={this.state.d4+` %`} animated  variant="success"/> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "ECO" dataFromParent2 = {this.props.dataFromParent}color = "success"/></td>
    <td className='large'><ProgressBar now={this.state.d5}  label={this.state.d5+` %`} animated  variant="success"/> </td>
  </tr>
</table>
               </div>
             <div className="item-2">
             <table class="default">
  <tr>
    <th>Goal</th>
    <th>Score</th>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "FIS" dataFromParent2 = {this.props.dataFromParent} color = "info"/></td>
    <td className='large'><ProgressBar now={this.state.d6}  label={this.state.d6+` %`} animated  variant="info"/> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "FP" dataFromParent2 = {this.props.dataFromParent} color = "info"/></td>
    <td className='large'><ProgressBar now={this.state.d7}  label={this.state.d7+` %`} animated  variant="info"/> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "HAB" dataFromParent2 = {this.props.dataFromParent} color = "info"/></td>
    <td className='large'><ProgressBar now={this.state.d8}  label={this.state.d8+` %`} animated variant="info" /> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "ICO" dataFromParent2 = {this.props.dataFromParent} color = "info"/></td>
    <td className='large'><ProgressBar now={this.state.d9}  label={this.state.d9+` %`} animated variant="info" /> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "LE" dataFromParent2 = {this.props.dataFromParent} color = "info"/></td>
    <td className='large'><ProgressBar now={this.state.d11}  label={this.state.d11+` %`} animated variant="info" /> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "LIV" dataFromParent2 = {this.props.dataFromParent} color = "info"/></td>
    <td className='large'><ProgressBar now={this.state.d12}  label={this.state.d12+` %`} animated  variant="info"/> </td>
  </tr>
</table>
               </div>
             <div className="item-3">
             <table class="default">
  <tr>
    <th>Goal</th>
    <th>Score</th>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "LSP" dataFromParent2 = {this.props.dataFromParent} color = "danger"/></td>
    <td className='large'><ProgressBar now={this.state.d13}  label={this.state.d13+` %`} animated variant="danger" /> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "MAR" dataFromParent2 = {this.props.dataFromParent} color = "danger"/></td>
    <td className='large'><ProgressBar now={this.state.d14}  label={this.state.d14+` %`} animated  variant="danger"/> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "NP" dataFromParent2 = {this.props.dataFromParent} color = "danger"/></td>
    <td className='large'><ProgressBar now={this.state.d15}  label={this.state.d15+` %`} animated  variant="danger"/> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "SP" dataFromParent2 = {this.props.dataFromParent} color = "danger"/></td>
    <td className='large'><ProgressBar now={this.state.d16}  label={this.state.d16+` %`} animated variant="danger" /> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "SPP" dataFromParent2 = {this.props.dataFromParent} color = "danger"/></td>
    <td className='large'><ProgressBar now={this.state.d17}  label={this.state.d17+` %`} animated variant="danger" /> </td>
  </tr>
  <tr>
    <td><PopupData dataFromParent = "TR" dataFromParent2 = {this.props.dataFromParent} color = "danger"/></td>
    <td className='large'><ProgressBar now={this.state.d18}  label={this.state.d18+` %`} animated  variant="danger"/> </td>
  </tr>
</table>
               </div>
           </div>
    </div>
    )
}
}

export { Valores }; 