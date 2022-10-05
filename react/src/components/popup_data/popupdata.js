import url from '../../constants/constants.js' 
 

import React from 'react'
 
import axios from 'axios'
import Popup from 'reactjs-popup';
import 'reactjs-popup/dist/index.css';
import ProgressBar from 'react-bootstrap/ProgressBar';
// import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';
class PopupData extends React.Component {
    constructor(props){
        super(props)
        this.state = {
      data:[],
      score:[],
         
        }
      }

      async getOptions(){
        const options_url = {
          headers: {
                  'Content-Type': 'application/json',
                  "Authorization": "token a5eece1a1bb0dcf21540c6f573f9c264ab6abfb5"
                }
              };
        const res = await axios.post(url+'/view/dimensiones/', {
            region:this.props.dataFromParent2,
            dimension:this.props.dataFromParent
      },options_url)
        const options = res.data
       
        this.setState({
            data:options.dimension,
      score:options.score,
        })
        
    
      }
      componentDidMount(){
        this.getOptions()
    }
    render() {
        let items=this.state.data;
        let score_data=this.state.score;
        let itemList=[];
        items.forEach((item,index)=>{
            
          itemList.push( <div>
            <h6>{items[index] } {score_data[index]+ ` %`}</h6>
            <ProgressBar now={score_data[index]}    animated  variant={this.props.color}/></div>)
        })
        return (
            <Popup trigger={<button type="button" class="btn btn-dark">{this.props.dataFromParent}</button>} position="right center">
            <div>
          
                {itemList}
                
            
             </div>
          </Popup>
        );
    }
}

export { PopupData }; 