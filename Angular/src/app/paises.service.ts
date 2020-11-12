import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Ipais } from './pais';

@Injectable({
  providedIn: 'root'
})
export class PaisesService {

  private _url: string = "/assets/data/paises.json";
  constructor(private http: HttpClient) { }

  getPaises(): Observable<Ipais[]>{
    return this.http.get<Ipais[]>(this._url);
  }
}
