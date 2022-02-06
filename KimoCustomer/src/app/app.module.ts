import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CommonModule }     from '@angular/common';

import { DesignsComponent } from './designs/designs.component';
import { DesignComponent } from './designs/design/design.component';
import { DesignlineComponent } from './designs/designline/designline.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatDialogModule } from '@angular/material/dialog';
import {HttpClientModule} from '@angular/common/http';
import { ToastrModule } from 'ngx-toastr';
import { ProductsComponent } from './products/products.component';
import { AccountComponent } from './account/account.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { ResetpasswordComponent } from './resetpassword/resetpassword.component';
import { VerifyComponent } from './verify/verify.component';
import { QuotationrequestService } from './shared/quotationrequest.service';
import { ViewquotationComponent } from './viewquotation/viewquotation.component';
import { WebsitesComponent } from './websites/websites.component';
import { NavbarComponent } from './navbar/navbar.component';
import { RequestComponent } from './request/request.component';
import { QuotereqsComponent } from './quotereqs/quotereqs.component';
import { HomepageComponent } from './homepage/homepage.component';
import {MatSnackBarModule} from '@angular/material/snack-bar';
import { LandingComponent } from './landing/landing.component';
import { OrdersComponent } from './orders/orders.component';
import {MatButtonModule} from '@angular/material/button';
import {MatIconModule} from '@angular/material/icon';

@NgModule({
  declarations: [
    AppComponent,
    DesignsComponent,
    DesignComponent,
    DesignlineComponent,
    ProductsComponent,
    AccountComponent,
    LoginComponent,
    RegisterComponent,
    ResetpasswordComponent,
    VerifyComponent,
    ViewquotationComponent,
    WebsitesComponent,
    NavbarComponent,
    RequestComponent,
    QuotereqsComponent,
    HomepageComponent,
    LandingComponent,
    OrdersComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    BrowserAnimationsModule,
    MatDialogModule,
    HttpClientModule,
    CommonModule,
    MatSnackBarModule,
    MatButtonModule,
    MatIconModule,
    
    ToastrModule.forRoot({
      timeOut: 3000,
      positionClass: 'toast-top-full-width',
      preventDuplicates: true,
    }),
  ],
  //entryComponents:[DesignlineComponent],
  providers: [QuotationrequestService],
 // providers: [DesignService],
  bootstrap: [AppComponent]
})
export class AppModule { }
