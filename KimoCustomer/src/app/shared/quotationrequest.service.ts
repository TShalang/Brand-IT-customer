import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { NgForm } from '@angular/forms';
import { environment } from 'src/environments/environment';
import { CustomerOrder } from './customer-order';
import { Customer } from './customer.model';
import { OrderVM } from './OrderVM';
import { Quotationrequest } from './quotationrequest.model';
import { QuoteVM } from './quote-vm';
import { Quotereqline } from './quotereqline.model';

@Injectable({
  providedIn: 'root'
})
export class QuotationrequestService {
  formData: Quotationrequest;
  //reqLine: Quotereqline[];
  reqLine = [];
  

  constructor(private http: HttpClient) { }

  getReqList() {
    return this.http.get(environment.apiURL + '/Quotation_Request').toPromise();
  }

  saveReq() {    
    var body = {
      ...this.formData,
      Quotation_Request_Line: this.reqLine
    };
    return this.http.post(environment.apiURL + '/Quotation_Request', body);
  }

  //api/Quotation_Request/PostQuotation_Request

  CreateQuotationRequest(newQuote : Quotationrequest){

    return this.http.post<Quotationrequest>( environment.apiURL + '/Quotation_Request/PostQuotation_Request' , newQuote).toPromise();

  }

  AddQuoteLines(QuoteLines : Quotereqline[] ){

    return this.http.post<any>(environment.apiURL + '/Quotation_Request/PostQuotation_Request_Line' , QuoteLines);

  }

  GetCustomerQuotes( id : number ){

    return this.http.get<QuoteVM[]>( environment.apiURL + '/Quotations/GetCustomerQuotations/' + id )

  }

  GetCustomerOrders( id : number ){

    return this.http.get<OrderVM[]>( environment.apiURL + '/Customer_Order/getCustOrders/' + id )

  }




  AcceptQuotation(QuoteID , CustomerOrderID){

    return this.http.get(environment.apiURL + '/Customer_Order/AcceptQuotation/' + QuoteID + '/' + CustomerOrderID)

  }

  CreateCustomerOrder(id : number){

    var customerOrder : CustomerOrder = new CustomerOrder();
    customerOrder.Customer_ID = parseInt(localStorage['Customer_ID'])

    return this.http.post<CustomerOrder>( environment.apiURL + '/Customer_Order/?id='+id  , customerOrder ).toPromise();

  }

  getRequestList() {
    return this.http.get(environment.apiURL + '/Quotation_Request').toPromise();
  }

  getWebList() {
    return this.http.get(environment.apiURL + '/Web_Link').toPromise();
  }

  getSizeList() {
    return this.http.get(environment.apiURL + '/Product_Size').toPromise();
  }
}