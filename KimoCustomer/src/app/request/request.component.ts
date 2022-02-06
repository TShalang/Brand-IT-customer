import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';

import { Prodtypes } from '../products/prodtype.model';
import { Designs } from '../products/prodtype.model';
import { DesignImage } from '../products/prodtype.model';
import { DesignLine } from '../products/prodtype.model';

import { DesignService } from '../shared/design.service';
import { Router } from '@angular/router';
import { CATCH_STACK_VAR } from '@angular/compiler/src/output/abstract_emitter';
import { CATCH_ERROR_VAR } from '@angular/compiler/src/output/output_ast';
import { Weblinks } from '../weblinks.model';
import { Prodsize } from '../prodsize.model';
import { Quote } from '@angular/compiler';
import { Quotereqline } from '../shared/quotereqline.model';
import { QuotationrequestService } from '../shared/quotationrequest.service';
import { Quotationrequest } from '../shared/quotationrequest.model';
import { ToastrModule, ToastrService } from 'ngx-toastr';
import { Supplier } from '../shared/supplier';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-request',
  templateUrl: './request.component.html',
  styleUrls: ['./request.component.css']
})
export class RequestComponent implements OnInit {


  types: Prodtypes[];
  designs: DesignImage[];
  designline: Designs[];
  lines : DesignLine[];
  designType : any;
  request = [];

  CurrentRequest: Quotereqline;
  RequestList: Quotereqline[] = [];
  ErrorMessages : string[] = [];
  

  TodayDate : string;

  webLinks : Weblinks[];
  sizes : Prodsize[];

  supp : Supplier[];

  constructor(public service : DesignService, private qrservice:QuotationrequestService, 
    private fb: FormBuilder, private router: Router, private toastr: ToastrService) { }

  ngOnInit(): void {
    this.TodayDate = new Date().toDateString();
    this.CurrentRequest = new Quotereqline();
    this.service.getTypes().then(res => this.types = res as Prodtypes[]);

    this.service.getSizes().subscribe( (sizes) => {
      this.sizes = sizes;
    })
    // this.service.getWebLinks().subscribe( (weblinks) => {

    //   this.webLinks = weblinks;

    // })

    this.service.getSupplierWeb().subscribe( (supp) => {

      this.supp = supp;
    })
  }
  
  store(id, name){
    this.CurrentRequest.Product_Type_ID = id;
    this.service.getProductTypeImage(name).then(resp => this.designs = resp as DesignImage[]);

    this.designType = this.service.getDesign(localStorage["Product_Type_ID"]).subscribe( (designType) => {
      this.designType = designType
    } );

    console.log(this.designType)

    this.service.getProductTypes(id,localStorage["Customer_ID"]).then( (respo) => 
    {
      this.designline = respo as Designs[]
    });

    localStorage["Product_Type_ID"] = id;
  }

  storeDesign(id){
    this.service.getDesignLines(id).then(response => this.lines = response as DesignLine[]);
    localStorage["Design_ID"] = id;
    this.CurrentRequest.Design_ID = id;
  }

  public isValid = false;
  //Add to Line
  addToRequest(){
 

    if (this.CurrentRequest.Colour == "" || this.CurrentRequest.Colour == undefined) {
      console.log(this.ErrorMessages);
      this.ErrorMessages.push('Please type in a color')
      this.isValid = false;
    }
    else
    {
      this.isValid = true;
    }

    if (this.CurrentRequest.Product_Size_ID == 0 || this.CurrentRequest.Product_Size_ID == undefined) {
      this.ErrorMessages.push('Please select a size')
      this.isValid = false;
    }else{
      this.isValid = true;
    }
    
    if (this.CurrentRequest.Design_ID == 0 || this.CurrentRequest.Design_ID == undefined) {
      this.ErrorMessages.push('Please Select a Design')
      this.isValid = false;
    }
    else{
      this.isValid = true;
    }

    if (this.CurrentRequest.Product_Code == "" || this.CurrentRequest.Product_Code == undefined) {
      this.ErrorMessages.push('Please enter a product code')
      this.isValid = false;
    }
    else
    {
      this.isValid = true;
    }

    if (this.isValid) {
      this.RequestList.push(this.CurrentRequest);
      this.CurrentRequest = new Quotereqline();
      console.log(this.RequestList);
      this.lines = [];
      this.isValid = false;
      this.ErrorMessages = [];
  
        // this.RequestList = [];
          this.designs = [];
          this.designline = [];
        // this.designType = null;
          this.CurrentRequest = new Quotereqline();
    }

    this.toastr.success('Added Successfully','Success!');

  }

  delete(i){
    //this.request.splice(i,1);
    this.RequestList.splice(i,1);
  }
  alertWithSuccess(){  
    Swal.fire('Success...', 'Quotation Request Sent!', 'success').then(function(result){
      location.reload();
                 }) ;    
  }
  //Sends to the API
  addRequest(){
    //console.log(this.request.length)
    var NewQuote = new Quotationrequest();
    NewQuote.Customer_ID = parseInt(localStorage.getItem("Customer_ID"));

    this.qrservice.CreateQuotationRequest(NewQuote).then( (request) => {

      console.log(request);
      this.RequestList.forEach(element => {
        
        element.Request_ID = request.Request_ID;
       
      });
      return this.RequestList;

    }).then( () =>
    {
      
      this.qrservice.AddQuoteLines(this.RequestList).subscribe( (res) => {

        console.log('All the requests now have the same RequestID')
        this.RequestList = [];
        this.designs = [];
        this.designline = [];
        this.CurrentRequest = new Quotereqline();

      })
      this.alertWithSuccess();
    }

    )
}

  navigate()
  {
    this.router.navigate(["design"]);
  }

}