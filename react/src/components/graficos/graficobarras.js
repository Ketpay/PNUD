import url from '../../constants/constants.js' 

import React  from 'react';
 
import axios from 'axios'
 
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend
  
} from 'chart.js';
import { Bar } from 'react-chartjs-2';
 

ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip ,
  Legend
);


export class Graficobarras extends React.Component {
  constructor(){
    super();
    this.state = {
      chartData:{},
      options:{},
      chartData2:{},
      options2:{}
    }
  }

  componentDidMount() {
    this.getChartData();
  }

  getChartData() {
    const options_url = {
            headers: {
              'Content-Type': 'application/json',
              "Authorization": "token a5eece1a1bb0dcf21540c6f573f9c264ab6abfb5"
            }
          };
          axios.post(url+'/metas/grafico/barras/', {
    
                dato:this.props.dataFromParentgrafico,
                
                },options_url)
        .then(res => {
        let titulo = "Gráfico de "+this.props.dataFromParentgrafico
        let datos = res.data;
        let labels = datos.fecha;
        let datas= datos.datasets;
        console.log(datas);
      this.setState({
        options: {   responsive: true,
          legend:{
            display:false
          },
          plugins: {
           
          title: {
              display: true,
              text: titulo,
            },
          },       }
      });
        this.setState({
          chartData: {
            labels:labels,
            datasets: datas
          }
        });
      });
    }

  render(){

        return (
          <div  >

{Object.keys(this.state.chartData).length &&
  
            <Bar options={this.state.options} data={this.state.chartData} style={{width:"400px"}}/>
          }
          

         
          </div>
        );

    }     
}

export default Graficobarras;