import { OrderLineVM } from './OrderLineVM';


export class OrderVM {

    constructor(){

    }

    OrderID : number;
    CustomerID : number;
    OrderStatusID : number;
    Orderstatus : string;
    CustomerName : string;
    CustomerEmail : string;
    CustomerNumber : string;
    orderLineVMs : OrderLineVM[];
    OrderTotal : number;
    Date : Date;

}
