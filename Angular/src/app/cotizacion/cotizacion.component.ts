import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { PaisesService } from '../paises.service';
import {BrowserModule} from '@angular/platform-browser';
import { Paises } from '../models/paises.enum';


@Component({
  selector: 'app-cotizacion',
  templateUrl: './cotizacion.component.html',
  styleUrls: ['./cotizacion.component.css']
})
export class CotizacionComponent implements OnInit {
  
  //, private _PaisesService: PaisesService
  constructor(private formBuilder : FormBuilder) { }

  //public paiseslist = [];
  public paisesList: any[] = [];
  ngOnInit(): void {
    for (let item in Paises) {
      if (isNaN(Number(item))) {
        this.paisesList.push({text:item,value: Paises[item]});
      }
    }
    console.log(this.paisesList);
    for (let itm of this.paisesList){
      console.log(itm.value);
      console.log(itm.text);
        
    }

    // this.llenarPaises()

  }

  // llenarPaises(){
  //   this._PaisesService.getPaises().subscribe(data => this.paiseslist = data);
    
  //   console.log(this.paises);

  // }

  CotizadorForm = this.formBuilder.group({
    peso: [''],
    alto: [''],
    largo: [''],
    ancho: [''],
    pais: ['']
  });

  submit(){
    console.log(this.CotizadorForm.value);
  }

  refrescar(){
    this.CotizadorForm.patchValue({
      peso: '',
      alto: '',
      largo: '',
      ancho: '',
      pais: '',
    })
  }

}
