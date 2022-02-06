import { QuoteLineVM } from './quote-line-vm';

export class QuoteVM {

    constructor(){

    }

    Quote_ID : number;
    CustomerID : number;
    CustomerName : string;
    CustomerEmail : string;
    CustomerNumber : string;
    quoteLineVMs : QuoteLineVM[];
    QuoteTotal : number;
    QuoteStatus : string;
    QuoteStatusID : number;
    TotalVat : number;
    Date : Date;

}
