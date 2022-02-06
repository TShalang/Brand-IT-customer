import { DesignLineVM } from './design-line-vm';

export class DesignVM {

    constructor(){
        this.DesignLineVMs = [];
    }
    
    Design_ID : number;
    Product_Type_ID : number;
    Product_Type : string
    Design_Name : string
    Additional_Instructions : string
    Customer_ID : number;
    Date_Created : string

    DesignLineVMs : DesignLineVM[];


}
