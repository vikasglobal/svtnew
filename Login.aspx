<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="eDiaryWebForms.Login" %>

<!DOCTYPE html>

<html ng-app="appModule">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Styles/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.js"></script>
    <script src="Styles/bootstrap/js/bootstrap.js"></script>
    <link href="Styles/login.css" rel="stylesheet" />
    <style>
        #LoginLoading {
            display: none;
        }
    </style>
</head>
<body ng-controller="LoginController">
    <form id="form1" runat="server">
        <div id="login_div">

            <div class="row">
                <div class="col-md-3">
                    <label>Username</label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3" style="width: 100%;">
                    <input type="text" id="username" ng-model="userLoginUserName" placeholder="Enter the Username" ng-change="CheckUserLoginUserName()" onkeypress="return LoginKeyPressForLogin(event);"/>
                    <span class="ErrorMsg" ng-bind="UserNameErrorMessage"></span>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <label>Password</label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3" style="width: 100%;">
                    <input type="password" id="password" ng-model="userLoginPassword" placeholder="Enter the Password" ng-change="CheckUserLoginPassword()" onkeypress="return LoginKeyPressForLogin(event);"/>
                    <span class="ErrorMsg" ng-bind="LoginPasswordErrorMessage"></span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3" style="width: 100%;">
                    <button id="login_button" class="btn" value="login" type="button" ng-click="login()">
                        login<img id="LoginLoading" src="Images/LoginLoading.gif" style="float: right; height: 20px;" /></button>
                    <span class="ErrorMsg" ng-bind="LoginErrorMessage"></span>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/angular.min.js"></script>
    <script type="text/javascript" src="Scripts/angular-animate.min.js"></script>
    <script type="text/javascript" src="Styles/bootstrap/js/ui-bootstrap-tpls-2.0.1.js"></script>
    <script src="Scripts/eDairyScripts/Module.js"></script>
    <script src="Scripts/eDairyScripts/LoginServices.js"></script>
    <script src="Scripts/eDairyScripts/LoginController.js"></script>
    <script>
    function LoginKeyPressForLogin(e) {
        e = e || window.event;
        if (e.keyCode == 13) {
            document.getElementById('login_button').click();
            return false;
        }
        return true;
    }
    </script>
</body>
</html>
