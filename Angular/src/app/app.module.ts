import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CotizacionComponent } from './cotizacion/cotizacion.component';
import {HttpClientModule} from '@angular/common/http';
import { PaisesService } from './paises.service';

@NgModule({
  declarations: [
    AppComponent,
    CotizacionComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule
  ],
  providers: [
    PaisesService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
