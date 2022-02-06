import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AccountComponent } from './account/account.component';
import { DesignComponent } from './designs/design/design.component';
import { DesignsComponent } from './designs/designs.component';
import { HomepageComponent } from './homepage/homepage.component';
import { LandingComponent } from './landing/landing.component';
import { LoginComponent } from './login/login.component';
import { OrdersComponent } from './orders/orders.component';
import { ProductsComponent } from './products/products.component';
import { RegisterComponent } from './register/register.component';
import { RequestComponent } from './request/request.component';
import { ResetpasswordComponent } from './resetpassword/resetpassword.component';
import { VerifyComponent } from './verify/verify.component';
import { ViewquotationComponent } from './viewquotation/viewquotation.component';
import { WebsitesComponent } from './websites/websites.component';


const routes: Routes = [
  {path: '', redirectTo: 'login', pathMatch: 'full'},
  {path: 'designs', component: DesignsComponent},
  {path: 'design', children: [
    {path: '', component: DesignComponent},
    {path: 'edit/:id', component: DesignComponent},
  
  ]},

  {path: 'quotationrequest', children: [
    {path: 'edit/:id', component: DesignComponent},
  ]},
  {path: 'products', component: ProductsComponent},
  {path: 'design/:id', component: DesignComponent},

  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'verify', component: VerifyComponent },
  { path: 'login', component: LoginComponent },
  {path: 'account', component: AccountComponent},
  {path: 'resetpassword', component: ResetpasswordComponent},
  {path: 'designs', component: DesignsComponent},
  {path: 'viewquotation', component: ViewquotationComponent},
  {path: 'websites', component: WebsitesComponent},
  {path: 'request', component: RequestComponent},
  {path: 'homepage', component: HomepageComponent},
  {path : 'ViewQuotations' , component : ViewquotationComponent},
  {path: 'resetpassword', component: ResetpasswordComponent},
  {path: 'landing', component: LandingComponent},
  {path: 'orders', component: OrdersComponent},
 
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
