<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/StoreFront.master" CodeBehind="HomePage.aspx.cs" Inherits="EDairyWebForms.HomePage1" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <style>
        .outOfStock {
            opacity: 0.3;
        }
        .SelectedProductCategory{
            font:20px;
            color:red;
        }
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div ng-controller="HomePageController">

        <span id="sidenav-button" onclick="openNav()">Categories</span>

        <div id="main-wrapper">
            <div class="container">
                <div id="products" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="Images/banner1.png" class="img-responsive" />
                        </div>

                        <div class="item">
                            <img src="Images/banner2.png" class="img-responsive" />
                        </div>

                        <div class="item">
                            <img src="Images/banner3.png" class="img-responsive" />
                        </div>
                        <ul class="list-inline" style="margin-top: -34px;">
                            <li style="float: right;"><a class="right carousel-control" href="#products"
                                role="button" data-slide="next"><span class="fa fa-chevron-circle-right"></span></a></li>
                            <li style="float: right;"><a class="left carousel-control" href="#products"
                                role="button" data-slide="prev"><span class="fa fa-chevron-circle-left"></span>
                            </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">

                <div id="SideNav" class="sidenav">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                <div class="col-sm-2" id="MVcategoryHeaderSection">
                    <h4 id="MVcategoryHeader">
                        <i class="glyphicon glyphicon-align-justify"></i>Categories</h4>
                    <div id="MVmenu-item">
                        <ul id="MVcategoryList">
                            <li title="{{productCategory.PC_Category}}" id="pc_{{productCategory.PC_Id}}" ng-repeat="productCategory in productCategoryList">
                                <div id="pc_div_{{productCategory.PC_Id}}" ng-class="{'arrow':productCategory.PC_Id==productCategoryId}" ng-click="ShowSubCategoryDiv(productCategory.PC_Id, productCategory.PC_Category, productCategory.ProductSubCategory[0].PSC_Id)">
                                    <a id="PC_{{productCategory.PC_Id}}" ng-class="{highlight:productCategory.PC_Id==productCategoryId}" ng-bind="productCategory.PC_Category"></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                </div>



                <div class="col-sm-2" id="categoryHeaderSection">
                    <h4 id="categoryHeader">
                        <i class="glyphicon glyphicon-align-justify"></i>Categories</h4>
                    <div id="menu-item">
                        <ul id="categoryList">
                            <li title="{{productCategory.PC_Category}}" id="pc_{{productCategory.PC_Id}}" ng-repeat="productCategory in productCategoryList">
                                <div id="pc_div_{{productCategory.PC_Id}}" ng-class="{'arrow':productCategory.PC_Id==productCategoryId}" ng-click="ShowSubCategoryDiv(productCategory.PC_Id, productCategory.PC_Category, productCategory.ProductSubCategory[0].PSC_Id)">
                                    <a id="PC_{{productCategory.PC_Id}}" ng-class="{highlight:productCategory.PC_Id==productCategoryId}" ng-bind="productCategory.PC_Category"></a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <!--Level 2 Category-->
                <div class="col-sm-10 product_menu" id="pc_psc_{{productCategory.PC_Id}}" ng-repeat="productCategory in productCategoryList" ng-show="productCategory.PC_Id==divProductCategoryId">
                    <ol class="level2category list-inline " style="display:none;">
                        <li ng-repeat="psc in productCategory.ProductSubCategory" ng-class="{'hidetext':productCategory.PC_Category==psc.PCS_SubCategory && productCategory.ProductSubCategory.length == 1}" ng-click="ShowSubCategoryProducts(psc.PSC_Id,productCategory.PC_Id)">
                            <div style="float: left;"><a id="psc_{{psc.PSC_Id}}" ng-class="{highlight:$first}" ng-bind="psc.PCS_SubCategory"></a></div>
                            <div style="float: left; margin-top: 9px;"><span ng-class="{hide:$last}">|</span></div>
                        </li>
                    </ol>
                </div>

                <div class="col-sm-10">
                    <div id="mobileview-breadcrumb" class="row" style="text-align:center;padding:10px;background:#eee;">
                        <span ng-bind="categoryText" >All</span>
                    </div>
                    <div ng-repeat="productCategory in productCategoryList" ng-show="((productCategory.PC_Id==productCategoryId) || (productCategoryId=='0'))">
                        <div class="product" id="p_psc_{{psc.PSC_Id}}" ng-repeat="psc in productCategory.ProductSubCategory" ng-show="((psc.PSC_Id==productSubCategoryId) || (productSubCategoryId=='0'))">
                            <div class="flavouredmilk">
                                <div id="flavouredmilklvl2Products">
                                    <div class="availHeader" style="display: none;">
                                        <h5>Available Flavours</h5>
                                    </div>
                                    <div class="col-md-3 col-sm-6 col-xs-12 description flavouredmilk" id="p_{{P_Id}}" ng-repeat="p in psc.Products">
                                        <a>
                                            <div class="img-thumbnail imageEffect">
                                                <span class="proName" ng-bind="p.ProductModels.P_Name"></span>
                                                <img ng-src="{{p.ProductModels.P_Image1}}" class="img-responsive" ng-class="{'outOfStock':SelectedPack.PackagingModels.PA_OpenStock =='0'}" ng-click="GoToDetails(p.ProductModels.P_Id)" />
                                                <div class="info">
                                                    <p class="price">
                                                        <span>Rs.</span>&nbsp<span ng-bind="(p.PriceFromRage | number:2)"></span><span ng-class="{'hide':p.PriceFromRage==p.PriceToRage}" ng-bind="' - ' + (p.PriceToRage | number:2)"></span><span class="pull-right quantityBox"></span>
                                                    </p>
                                                    <p class="desc" style="height: 60px;" ng-bind="p.ProductModels.P_ShortDescription">
                                                    </p>

                                                    <div class="row">
                                                        <div class="col-xs-12 col-sm-12" style="padding-left: 3px; padding-right: 0px;">
                                                            <span class="input-group quantityBox"><span class="input-group-addon">Size</span>
                                                                <select ng-model="SelectedPack" ng-init="SelectedPack=p.PacksizeAndPricingList[0]" ng-options="packaging.PackagingModels.PA_Size+ ' ' + packaging.PackagingModels.PA_PackingDescription +' Rs.'+(packaging.PricingModels.PR_CustomerPrice|number:2)  for packaging in p.PacksizeAndPricingList  track by packaging.PackagingModels.PA_Id" class="pack_dd">
                                                                </select>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-xs-5 col-sm-5" style="padding-left: 3px; padding-right: 0px;">
                                                            <span class="input-group quantityBox"><span class="input-group-addon" style="padding: 0px 6px !important;">Qty</span><input id="PQuantity_{{p.ProductModels.P_Id}}" class="form-control" type="number" value="1" min="1" max="{{SelectedPack.PackagingModels.PA_OpenStock}}" ng-init="p.Quantity=1" ng-model="p.Quantity" ng-change="CheckQuantity(p.ProductModels.P_Id, SelectedPack.PackagingModels.PA_OpenStock)" /></span>
                                                        </div>
                                                        <div class="col-xs-6 col-sm-6" style="padding-left: 0px; padding-right: 0px; float: right;">
                                                            <span class="priceheading">Total</span><span class="amountText ng-binding" ng-bind="'Rs.' + ((SelectedPack.PricingModels.PR_CustomerPrice*p.Quantity) | number:2)"></span>
                                                        </div>
                                                    </div>
                                                    <div class="row" id="cart_btn_div" style="margin-top: 20px;">
                                                        <div class="col-xs-12">
                                                            <button ng-show="SelectedPack.PackagingModels.PA_OpenStock !='0'" type="button" class="btn btn-addtocart" ng-click="AddToCart(p.ProductModels.P_Id, p.Quantity, p.ProductModels.P_Name, SelectedPack.PricingModels.PR_CustomerPrice, SelectedPack.PricingModels.PR_VAT_RATE, SelectedPack.PackagingModels.PA_Size, SelectedPack.PackagingModels.PA_Id, SelectedPack.PackagingModels.PA_PackingDescription)"><span class="fa fa-shopping-cart fa-shoppingcart-custom"></span><span class="buttonText">Add to Cart</span></button>
                                                            <button ng-show="SelectedPack.PackagingModels.PA_OpenStock =='0'" type="button" class="btn btn-notifyMe" ng-click="Notify(p.ProductModels, SelectedPack.PackagingModels)">Out of stock - Notify me</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <!--promo popup -->

    <div class="modal fade" id="promo" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-body">
                    <span class="modal_close" data-dismiss="modal"><i class="fa fa-times-circle"></i></span>
                    <img class="img-responsive" src="../Images/promobanner1.1.png" />
                </div>
            </div>

        </div>
    </div>


    <!--promo popup -->

    <script src="Scripts/eDairyScripts/HomePageServices.js"></script>
    <script src="Scripts/eDairyScripts/HomePageController.js"></script>


    <script>
        $(document).ready(function () {

            $('ol').click(function () {
                $('#level2category li a').css("color", "#000000");
                $(this).css("color", "#fff");
            });

            $('#categoryList li div').click(function () {
                $('#categoryList li div').removeClass("arrow");
                $(this).addClass("arrow");
                $('#categoryList li div a').css("color", "#000");
            });




        });
    </script>

    <script>
        function openNav() {
            document.getElementById("SideNav").style.width = "250px";
            //document.body.style.opacity = "rgba(0,0,0,0.4)";
        }

        function closeNav() {
            document.getElementById("SideNav").style.width = "0";
            //document.body.style.backgroundColor = "white";
        }


</script>


</asp:Content>
