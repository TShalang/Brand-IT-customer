import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { DesignVM } from '../designs/design-vm';
import { Prodsize } from '../prodsize.model';
import { Prodtypes } from '../products/prodtype.model';
import { Size } from '../size';
import { Weblinks } from '../weblinks.model';
import { Design } from './design.model';
import { Designline } from './designline.model';
import { Supplier } from './supplier';

@Injectable({
  providedIn: 'root'
})
export class DesignService {
  formData: Design;
  designLine = [];


  constructor(private http: HttpClient) { }

  saveDesign() {
    var body = {
      ...this.formData,
      Design_Line: this.designLine
    };
    console.log(body)
    return this.http.post(environment.apiURL + '/Design', body);
  }

  getDesignList() {
    return this.http.get(environment.apiURL + '/Design').toPromise();
  }

  getDesigns(){
    return this.http.get(environment.apiURL + '/getAllDesigns').toPromise();
  }

  getCategories(){
    return this.http.get(environment.apiURL +'/Product_Category').toPromise();
   }

   getProductType(id){
     console.log('service ' + id)
    return this.http.get('https://localhost:44369/api/Product_Type/getProductTypes/'+id).toPromise();
   }

   getProductTypes(id, custID){
   return this.http.get('https://localhost:44369/api/Product_Category/getProductTypes/'+id+'/'+custID).toPromise();
  }

   getTypes(){
    return this.http.get(environment.apiURL +'/Product_Type/getProductTypes').toPromise();
   }
   getWebLinks(){
    return this.http.get<Weblinks[]>(environment.apiURL +'/Web_Link');
   }



   getSupplierWeb(){
    return this.http.get<Supplier[]>(environment.apiURL +'/Suppliers');
   }



   getSizes(){
    return this.http.get<Prodsize[]>(environment.apiURL +'/Product_Size');
   }

   getDesignType(id: number) : Observable<Prodtypes> {
     const url = `${environment.apiURL }/Product_Type/${id}`
     return this.http.get<Prodtypes>(url);
   }

   getProductTypeImage(id){
   return this.http.get('https://localhost:44369/api/Product_Category/getProductTypeImage/'+id).toPromise();
  }

   getDesign(id){
    return this.http.get<any>("https://localhost:44369/api/Designs/getDesign/"+id).pipe(map(result=>result));;
  }

  getCustomerDesign(id){
    return this.http.get<DesignVM[]>("https://localhost:44369/api/Design/GetCustomerDesigns/"+id);
  }

  // getDesign(id){
  //   return this.http.get<DesignVM[]>("https://localhost:44369/api/Designs/GetDesignID/"+id);
  // }









  getDesignLines(id){
    return this.http.get<any>("https://localhost:44369/api/Product_Category/getDesignLines/"+id).toPromise();
  }

  createRequest( custID,  designID,  sizeID,  color,  webID,  prodCode, quantity) {
    console.log("service")
    return this.http.get('https://localhost:44369/api/Product_Category/createRequest/'+ custID + '/'+ designID + '/' + sizeID  + '/'+ color + '/' + webID + '/' + prodCode  + '/'+ quantity).toPromise();
  }

  url = 'https://localhost:44369/api/Designs';
  upload(file){
    const httpOptions ={
      headers: new HttpHeaders({
        'Content-Type' : "application/json",
        'Access-Control-Origin': "*"
      })
    }
    return this.http.post<any>(`${this.url}/upload`, {file: file}, httpOptions);
  }

}
