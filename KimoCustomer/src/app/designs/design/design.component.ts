import { NgForOf } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormControl, NgForm } from '@angular/forms';
import { MatDialog, MatDialogConfig } from '@angular/material/dialog';
import { ActivatedRoute, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

import { from } from 'rxjs';
import { Prodtypes } from 'src/app/products/prodtype.model';
import { ProductsComponent } from 'src/app/products/products.component';
import { Customer } from 'src/app/shared/customer.model';
import { CustomerService } from 'src/app/shared/customer.service';
import { Design } from 'src/app/shared/design.model';
import { DesignService } from 'src/app/shared/design.service';
import { Designline } from 'src/app/shared/designline.model';
import { Jobtype } from 'src/app/shared/jobtype.model';
import { Tempposition } from 'src/app/shared/tempposition.model';
import { TemppositionService } from 'src/app/shared/tempposition.service';
import Swal from 'sweetalert2';
import { DesignLineVM } from '../design-line-vm';
import { DesignlineComponent } from '../designline/designline.component';

@Component({
  selector: 'app-design',
  templateUrl: './design.component.html',
  styleUrls: ['./design.component.css']
})
export class DesignComponent implements OnInit {
  cusList: Customer[];
  isValid: boolean = true;
  showForm = false;
  designType: any;

  formData:DesignLineVM;
  posList: Tempposition[];
  jobList: Jobtype[];
  selectedFile: File




  constructor(public service: DesignService,
    private dialog:MatDialog, public customerService: CustomerService,
    private toastr:ToastrService, private router:Router, private route:ActivatedRoute,
    public posService: TemppositionService,) { }

  ngOnInit(): void {

    this.resetForm();
    this.resetDL();
    //const id = +this.route.snapshot.paramMap.get('id');
     this.designType = this.service.getDesign(localStorage["Product_Type_ID"]).subscribe(designType => this.designType = designType );
     console.log(this.designType)
     this.posService.getPositionList().then(res => this.posList = res as Tempposition[]);
     this.posService.getJobTypeList().then(res => {this.jobList = res as Jobtype[],console.log(res)} );
    }

     //this.customerService.getCustomer().then(res => this.cusList = res as Customer[]);

  resetDL(form?:NgForm){

    this.formData = {
      Design_Line_ID: null,
      Design_ID: null,
      Template_Position_ID: 0,
      Job_Type_ID: 0,
      Job_Type: "",
      Width: 0,
      Height: 0,
      Image: '',
      Text: '',
  }
  this.object.url = false;
}

  resetForm(form?:NgForm){
    if(form=null)
    form.resetForm();
    this.service.formData = {
    Design_ID: null,
    Additional_Instructions:'',
    Product_Type_ID: localStorage["Product_Type_ID"],
    Customer_ID: localStorage["Customer_ID"],
    Design_Name: '',
    Date_Created: new Date()
    };
    this.service.designLine=[];
  }

  // AddDesign(designLineIndex, Design_ID){
  //   const dialogConfig = new MatDialogConfig();
  //   dialogConfig.autoFocus = true;
  //   dialogConfig.disableClose = true;
  //   dialogConfig.width="30%";
  //   dialogConfig.data = {designLineIndex, Design_ID};
  // this.dialog.open(DesignlineComponent, dialogConfig);

  // }

  AddDesign(form: NgForm, designLineIndex, Design_ID){
    console.log(form.value)
    if (this.validate(form.value)) {
      form.form.addControl( 'Image' , new FormControl('') );
      form.controls['Image'].setValue(this.formData.Image);
      if (designLineIndex == null)
        this.service.designLine.push(form.value);
      else
      this.service.designLine[designLineIndex] = form.value;
      this.resetDL();

    }
  
  }
  validate(formData: DesignLineVM) {
    this.isValid = true;
    if (formData.Template_Position_ID == 0)
      this.isValid = false;
    else if (formData.Job_Type_ID == 0)
      this.isValid = false;
    else if (formData.Width <= 0)
      this.isValid = false;
    else if (formData.Height <= 0)
      this.isValid = false;
    return this.isValid;
  }


  
    // onFileChanged(event) {

    //   this.selectedFile = event.target.files[0];
    //   let reader = new FileReader();
    //   reader.readAsDataURL(this.selectedFile);
    //   var ImageAsBase64  = "";

    //   reader.onload = () => {
    //     console.log(reader.result);
    //     ImageAsBase64=reader.result.toString();
    //     reader.readAsDataURL(this.selectedFile)
    //   };
    //   reader.onerror = function (error) {
    //     console.log('Error: ', error);
    //   };
    //   this.formData.Image = ImageAsBase64.toString();


    // }

    handleFileSelect(evt){
      var files = evt.target.files;
      var file = files[0];
    
    if (files && file) {
        var reader = new FileReader();

        reader.onload =this._handleReaderLoaded.bind(this);

        reader.readAsBinaryString(file);
    }
  }
  
  _handleReaderLoaded(readerEvt) {
     var binaryString = readerEvt.target.result;
     this.formData.Image= btoa(binaryString);
            console.log(btoa(binaryString));
    }

  onDeleteDesignLine(designLineID: number, i: number){
    //if (designLineID !=null)
    //this.service.formData.DeletedOrderItemIDs += designLineID + ",";
    this.service.designLine.splice(i,1);
  }

  validateForm(){
    this.isValid = true;
    if(this.service.formData.Customer_ID==0)
    this.isValid = false;
    else if(this.service.designLine.length==0)
    this.isValid = false;
    else if(this.service.formData.Design_Name=='')
    this.isValid = false;
    return this.isValid;
  }

  alertWithSuccess(){  
    Swal.fire('Success...', 'Product Design Saved!', 'success') ;
   
    this.router.navigate(['/designs']);
  }
  onSubmit(){
    if(this.validateForm())
    {
      this.service.saveDesign().subscribe(res => {
        this.resetForm();
        this.alertWithSuccess();
        //this.router.navigate(['designs']);
      })
    }

  }

  upload(){
    this.service.upload(this.object.url).subscribe(x=>{
      console.log(x);
    })

  }

  public object: any = {};

  file(i){
    if(i.files && i.files[0]){
      var r = new FileReader();
      r.onload = (e : any) => {
        console.log(e.target.result)
        this.formData.Image = e.target.result;

        this.object.url = e.target.result;
      }
      r.readAsDataURL(i.files[0]);
    }

  }




  show(){

            this.showForm = true;

  //           if (this.showForm = false)
  //   this.showForm = true

  // else if (this.showForm = true)
  //   this.showForm = false
  }

  hideForm(){
    this.showForm = false;

  }

  Submit(form)
  {
      console.log(form)
  }







}
