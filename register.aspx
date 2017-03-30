<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/StoreFront.master" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <style>
        #LoginLoading {
            display: none;
        }
        .btn {
            border-radius: 4px;
            background: #3aceff;
        }

            .btn:hover {
                background: #000;
                color: #fff;
            }


        #registerDiv {
            /*background: #efefee;*/
            padding-bottom: 20px;
            padding-left: 0px;
            margin-left: 31px;
            align-items: stretch;            
        }

        #loginDiv {
            /*background: #efefee;*/
            padding-top: 70px;
            padding-bottom: 60px;
            margin-left: 30px;
        }

            #registerDiv > .row, #loginDiv > .row {
                margin-left: 0px;
                margin-top: 10px;
                padding-left: 25%;
            }

            #registerDiv > h3, #loginDiv > h3 {
                margin-left: 0px;
                margin-top: 10px;
                padding-left: 25%;
            }

        #registerDiv > .row > input[type="button"] {
            width: 33%;
            margin-left: 0px;
        }

        #loginDiv > .row > input[type="button"] {
            width: 250px !important;
            height: 40px;
            margin-top: 15px;
        }

        #register-link {
            color: #3aceff;
            text-decoration: none;
            font-size: 12px;
        }

        #side-content > .list-inline {
            margin-left: 0px;
        }

            #side-content > .list-inline > li {
                margin-top: 10px;
            }

        .icon-list {
            font-size: 20px;
            margin-right: 5px;
        }


        @media screen and (max-width:600px) {
            #side-content {
                display: none;
            }
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header Section Start-->
    <div ng-controller="CustomerAccountController">
      <!--Main Content starts-->
         <!--mobile cart modal start-->
        <div class="modal fade" id="mobile-cart" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" id="cart-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Shopping Cart</h4>
                    </div>
                    <div class="modal-body">
                        <ul id="cart-list">
                            <li id="C_{{p.P_Id}}" ng-repeat="p in EdiaryCartList"><a style="color: #2f2f2f; line-height: 2.2;" ng-class="{cart_products:!$last}"><span style="padding-left: 10px;" ng-bind="p.P_Name">Dharwad Peda</span><span ng-bind=" ' (' + p.P_PackSize + ')  ' ">(1)&nbsp&nbsp</span><span ng-bind="' - ' + p.P_Quantity"></span>&nbsp;<div style="float: right;"><span ng-bind="'Rs.' + (p.P_Price | number:2)">70</span></div>
                                <div class="clearfix"></div>
                            </a></li>
                            <hr />
                            <li><a style="color: #2f2f2f;"><span style="padding-left: 10px;">Total :</span> <span id="total">&nbsp&nbsp <span style="float: right;" ng-bind="'Rs.' + (TotalPrice | number:2)"></span></span></a></li>
                            <li><a style="color: #2f2f2f;"><span style="padding-left: 10px;">Grand Total :</span> <span id="grandtotal">&nbsp&nbsp <span style="float: right;" ng-bind="'Rs.' + (GrandTotal | number:2)"></span></span></a></li>
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <ul id="checkout-mobile" class="list-inline pull-right" >
                            <li>
                                <button type="button" class="btn btn-sm" ng-click="viewCart()">View Cart</button></li>
                            <li>
                                <button type="button" class="btn btn-sm" ng-click="checkOut()">Checkout</button></li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
        <!--mobile cart modal end-->
        <div class="container" style="margin-bottom: 40px;">
            <div class="row" style="margin-top: 25px; display: flex;">
                <div class="col-md-6 col-sm-6 col-xs-12" style="align-items: stretch;">
                    <div class="row" id="loginDiv" ng-show="Mode != 'register'">
                        <h3>Registered Customer</h3>
                        <div class="row">
                            eMail                    
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-8" style="padding: 0px;">
                                <input id="email" type="text" class="form-control" placeholder="Enter your eMail ID" ng-init="user.userName=''" ng-model="user.userName" ng-change="CheckLoginUserName()" onkeypress="return LoginKeyPressForLogin(event);"/>
                                <span class="ErrorMsg" ng-bind="LoginUserNameErrormessage"></span>
                            </div>
                        </div>
                        <div class="row">
                            Password                    
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-8" style="padding: 0px;">
                                <input type="password" class="form-control" placeholder="Enter the Password" ng-init="user.password=''" ng-model="user.password" ng-change="CheckLoginPassword()" onkeypress="return LoginKeyPressForLogin(event);"/>
                                <span class="ErrorMsg" ng-bind="LoginPasswordErrormessage"></span>
                            </div>
                        </div>
                        <div class="row" style="margin-left: 0px; margin-top: 10px;">
                            <div class="col-xs-12 col-sm-8" style="padding: 0px;">
                                <button id="btn_login" type="button" class="btn"  ng-click="login(user)">
                                    Login
                                    <img id="LoginLoading" src="Images/LoginLoading.gif" style="float: right; height: 20px; margin-bottom: 2px;" />
                                </button>
                                <span class="ErrorMsg" ng-bind="LoginErrorMessage"></span>
                                <br />
                                <div style="text-align:center;"><a href="ShoppingCart/ForgotPassword.aspx" style="font-size: 10px; text-decoration: none">Forgot Password?</a></div>
                            </div>
                        </div>
                        <div class="row" style="padding-left: 0px;">
                           <div style="text-align:center;"><a id="register-link" ng-click="ChangeType('register')">New User? Register</a></div> 
                        </div>
                    </div>
                    <div class="row" id="registerDiv" ng-show="Mode == 'register'">
                        <h3>Register Account</h3>
                        <div class="row">
                            Name                    
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-8" style="padding: 0px;">
                                <input id="R_Name" type="text" class="form-control" placeholder="Enter your Name" ng-init="userInfo.R_Name=''" ng-model="userInfo.R_Name" ng-change="CheckName()" maxlength="50" onkeypress="return LoginKeyPressForRegister(event);"/>
                                <span class="ErrorMsg" ng-bind="NameErrormessage"></span>
                            </div>
                        </div>
                        <div class="row">
                            Mobile                    
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-8" style="padding: 0px;">
                                <input type="text" class="form-control" placeholder="Enter your Mobile" ng-init="userInfo.R_Mobile=''" ng-model="userInfo.R_Mobile" ng-change="CheckMobileNumber()" maxlength="10" onkeypress="return LoginKeyPressForRegister(event);"/>
                                <span class="ErrorMsg" ng-bind="MobileNumberErrormessage"></span>
                            </div>
                        </div>
                        <div class="row">
                            eMail                    
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-8" style="padding: 0px;">
                                <input type="text" class="form-control" id="R_EmailId" placeholder="Enter your eMail ID" ng-init="userInfo.R_EmailId=''" ng-model="userInfo.R_EmailId" ng-change="CheckEmail()" maxlength="50" onkeypress="return LoginKeyPressForRegister(event);"/>
                                <span class="ErrorMsg" ng-bind="EmailErrormessage"></span>
                            </div>
                        </div>
                        <div class="row">
                            Address                    
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-8" style="padding: 0px;">
                                <textarea class="form-control" placeholder="Enter your Address" ng-init="userInfo.R_Address=''" ng-model="userInfo.R_Address" ng-change="CheckAddress()" maxlength="140" onkeypress="return LoginKeyPressForRegister(event);"></textarea>
                                <span class="ErrorMsg" ng-bind="AddressErrormessage"></span>
                            </div>
                        </div>
                        <div class="row">
                            pincode                    
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-8" style="padding: 0px;">
                                <input type="text" class="form-control" placeholder="Enter valid pincode" ng-init="userInfo.R_Pincode=''" ng-model="userInfo.R_Pincode" ng-change="CheckPincode()" maxlength="6" onkeypress="return LoginKeyPressForRegister(event);"/>
                                <span class="ErrorMsg" ng-bind="PincodeErrorMessage"></span>
                            </div>
                        </div>

                        <div class="row">
                            Password                    
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-8" style="padding: 0px;">
                                <input type="password" class="form-control" placeholder="Enter Password" ng-init="userInfo.R_Password=''" ng-model="userInfo.R_Password" ng-change="CheckPassword()" maxlength="50" onkeypress="return LoginKeyPressForRegister(event);"/>
                                <span class="ErrorMsg" ng-bind="PasswordErrorMessage"></span>
                            </div>
                        </div>
                        <div class="row">
                            Confirm Password                    
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-8" style="padding: 0px;">
                                <input type="password" class="form-control" placeholder="Confirm password" ng-init="userInfo.R_ConfirmPassword=''" ng-model="userInfo.R_ConfirmPassword" ng-change="CheckConfirmPassword()" maxlength="50" onkeypress="return LoginKeyPressForRegister(event);"/>
                                <span class="ErrorMsg" ng-bind="ConfirmPasswordErrorMessage"></span>
                            </div>
                        </div>
                        <div class="row" id="btn-div">
                            <input id="btn_register" type="button" class="btn" value="Register" ng-click="Register(userInfo)" />
                            <input type="button" class="btn" value="Clear" ng-click="RegisterClear()"/>
                        </div>

                        <div class="row" style="padding-left: 0px;">
                            <div style="text-align:center;"><a id="signin-link" ng-click="ChangeType('signin')" style="border: 0px;">Sign in</a></div>
                        </div>
                    </div>

                </div>
                <div class="col-md-6 col-sm-6 col-xs-12" id="side-content" style="align-items: stretch; padding-top: 58px; padding-bottom: 60px;">
                    <div class="container" style="box-shadow: -11px 8px 20px 2px #ccc;padding: 0px;">
                        <div id="promo-carousel"  class="carousel slide" data-ride="carousel" style="margin:0px;">
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="Images/promobanner1.1.png" class="img-responsive"/>
                        </div>
                        <div class="item">
                            <img src="Images/promobanner2.1.png" class="img-responsive"/>
                        </div>
                    </div>
                </div>
                    </div>
                </div>

        </div>
    </div>
    <!--Main Content ends-->
    <script src="Scripts/eDairyScripts/CustomerAccountServices.js"></script>
    <script src="Scripts/eDairyScripts/CustomerAccountController.js"></script>
    <script>
        function LoginKeyPressForLogin(e) {
            e = e || window.event;
            if (e.keyCode == 13) {
                document.getElementById('btn_login').click();
                return false;
            }
            return true;
        }

        function LoginKeyPressForRegister(e) {
            e = e || window.event;
            if (e.keyCode == 13) {
                document.getElementById('btn_register').click();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
