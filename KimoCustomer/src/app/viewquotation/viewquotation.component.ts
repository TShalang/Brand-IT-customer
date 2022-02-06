import { Component, OnInit } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { QuotationrequestService } from '../shared/quotationrequest.service';
import { QuoteVM } from '../shared/quote-vm';
import { QuoteLineVM } from '../shared/quote-line-vm';
import { Hash } from '../hash';
import { Router } from '@angular/router';
import { GlobalvariablesService } from '../globalvariables.service';
import { ApiService } from '../api.service';

@Component({
  selector: 'app-viewquotation',
  templateUrl: './viewquotation.component.html',
  styleUrls: ['./viewquotation.component.css']
})
export class ViewquotationComponent implements OnInit {

  
  totalPrice = 0;
  totalVat = 0;
  totalQuantity = 0;
  order : any =[];
  fileToUpload: File = null;
  MD5string :string = '';
  payable=false;
  obj:Hash= new Hash();


  quotations: string[];
  quotationdetail: string[];

  QuoteList : QuoteVM[] = [];
  CurrentQuoteLines : QuoteLineVM[];
  CurrentQuoteID : number;

  status = 0;

  isShow = false;
  

  constructor (private httpService: HttpClient , public quotationRequestService : QuotationrequestService,
    private router:Router, private gVars:GlobalvariablesService, private apiService : ApiService) { }
  
  ngOnInit() {
    this.httpService.get('https://localhost:44369/api/Quotation/getQuotationDetails/' +  parseInt(localStorage['Customer_ID'])  ).subscribe (data => {
      this.quotations = data as string [];
      console.log(this.quotations)
    });

      this.quotationRequestService
      .GetCustomerQuotes( parseInt(localStorage['Customer_ID']) )
      .subscribe( (quoteVMList) => {

        this.QuoteList = quoteVMList;
        console.log(this.QuoteList);

      })

}


 


  QuoteDetails(id){
    
    localStorage["Quotation_ID"] = id;
    
    var CurrentQuote = this.QuoteList.find( ql => ql.Quote_ID == id );
    this.CurrentQuoteID = id;

    this.CurrentQuoteLines = CurrentQuote.quoteLineVMs;
    this.totalVat = CurrentQuote.TotalVat;
    this.totalPrice = CurrentQuote.QuoteTotal;
    this.status = CurrentQuote.QuoteStatusID;
  
   
  }

  AcceptQuotation( ){

    this.quotationRequestService.CreateCustomerOrder(this.CurrentQuoteID).then( (res) => {

      this.quotationRequestService.AcceptQuotation( this.CurrentQuoteID , res.Customer_Order_ID )
      .subscribe( (res) => {

        console.log('Customer Order has been created!')
        this.isShow = !this.isShow;
      })

    })

  }

}
