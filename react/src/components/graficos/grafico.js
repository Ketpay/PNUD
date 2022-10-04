 
import url from '../../constants/constants.js' 


import React from 'react';
 
import axios from 'axios'
  
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
//   Legend,
} from 'chart.js';
import { Line } from 'react-chartjs-2';
 

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  
);


export class Grafico extends React.Component {
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
            axios.post(url+'/view/meta/grafico/', {
      
                    dato:this.props.dataFromParentgrafico,
                  
                  },options_url)
          .then(res => {
        
          let datos = res.data;
          let labels = datos.fecha;
          let valores = datos.valores;
          console.log(valores)
          let tipo = datos.tipo;
          let titulo = "Gráfico de "+this.props.dataFromParentgrafico
  
        //   let toma1=[];
      
      
        //   for (let i =0; i<valores.length; i++)  {
        //     toma1.push(valores[i][0]);
        //     console.log(toma1)
         
        //   }
          
        this.setState({
          options: {   responsive: true,
            scales: {
              y:
                {
                //   min: 0,
                //   max: 30,
                  stepSize: 20,
                },
              x:
                {
                  
                },
            },
            plugins: {
            title: {
                display: true,
                text:  titulo,
              },
            },       }
        });
          this.setState({
            chartData: {
              labels:labels,
              datasets: [
                {
                  label: tipo,
                  data: valores,
                  backgroundColor: '#287ef2',
                  borderColor: '#287ef2',
                }
               
              ]
            }
          });
        });
      }
  
    render(){
  
          return (
            <div className="tablas">
  
          {Object.keys(this.state.chartData).length &&
       
              <Line options={this.state.options} data={this.state.chartData} 
              />}
          
  
            
  
           
            </div>
          );
  
      }     
  }
  
  export default Grafico;