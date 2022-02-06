import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { DesignService } from '../shared/design.service';
import { DesignVM } from './design-vm';
import { DesignLineVM } from './design-line-vm';
import { DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-designs',
  templateUrl: './designs.component.html',
  styleUrls: ['./designs.component.css']
})
export class DesignsComponent implements OnInit {

  designs: string[];
  designline: string[];
  productType: Object=null;
  designList: DesignVM[] = [];

  CurrentDesignList : DesignLineVM[] = [];

  constructor(
    private httpService: HttpClient, 
    private router:Router, 
    public service: DesignService,
    private sanitizer: DomSanitizer,
    ) { }

  ngOnInit() {
    // this.httpService.get('https://localhost:44369/api/GetAllDesigns').subscribe (data => {
    //   this.designs = data as string [];
    
      // this.httpService.get('https://localhost:44369/api/Designs/getDesign/'+localStorage["Product_Type_ID"]).subscribe (data => {
      //   this.designs = data as string [];
      this.service.getCustomerDesign(localStorage["Customer_ID"]).subscribe( (designList) => {
        this.designList = designList;
        
      });
  // });
}
  requestdesigndetails(id) {

    localStorage["Design_ID"] = id;

    this.CurrentDesignList = this.designList.find( dl => dl.Design_ID == id).DesignLineVMs;
    console.log(this.CurrentDesignList)
    

    // this.httpService.get('https://localhost:44369/api/Design/GetDesignID/'+id).subscribe (res => {
    //   this.designline = res as string [];
    // });
  }

  transform(image: string) {
    if (image) {
      return this.sanitizer.bypassSecurityTrustResourceUrl(
        "data:image;base64," + image
      );
    } else {
      return "../../../../assets/NoImage.jpg";
    }
  }

  generate() {
    this.router.navigate(["quotationrequest"]);
  }

  

  
}
