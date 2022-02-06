import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { OrderLineVM } from '../shared/OrderLineVM';
import { OrderVM } from '../shared/OrderVM';
import { QuotationrequestService } from '../shared/quotationrequest.service';

@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.css']
})
export class OrdersComponent implements OnInit {

  orders: string[];
  orderdetail: string[];

  OrderList : OrderVM[] = [];
  CurrentOrderLines : OrderLineVM[];
  CurrentOrderID : number;

  constructor(private httpService: HttpClient,  public quotationRequestService : QuotationrequestService) { }

  ngOnInit() {
    this.httpService.get('https://localhost:44369/api/Customer_Order/getCustOrders').subscribe (data => {
    this.orders = data as string [];
   
  });

    this.quotationRequestService
    .GetCustomerOrders( parseInt(localStorage['Customer_ID']) )
    .subscribe( (orderVMList) => {

      this.OrderList = orderVMList;
      console.log(this.OrderList);

    })
}

OrderDetails(id){
    
  localStorage["Customer_Order_ID"] = id;
  
  var CurrentOrder = this.OrderList.find( ql => ql.OrderID == id );
  // this.CurrentQuoteID = id;

  this.CurrentOrderLines = CurrentOrder.orderLineVMs;
  // this.totalVat = CurrentQuote.TotalVat;
  // this.totalPrice = CurrentQuote.QuoteTotal;

 
}



}
