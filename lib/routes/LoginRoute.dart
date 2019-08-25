//
// LoginRoute.dart
// flutter_demo
//
// Created by c344081 on 2019/8/23.
// Copyright © 2019 c344081. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/index.dart';
import '../i10n/_localization.dart';
import '../common/global.dart';
import 'package:provider/provider.dart';
import '../common/profileChangeNotifier.dart';
import '../common/git.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool pwdShow = false; //密码是否显示明文
  GlobalKey _formKey = new GlobalKey<FormState>();
  bool _nameAutoFocus = true;

  @override
  void initState() {
    // 自动填充上次登录的用户名，填充后将焦点定位到密码输入框
    _unameController.text = Global.profile.lastLogin;
    print("_unameController.text == ${""}: ${_unameController.text == ""}");
    if (_unameController.text != null && _unameController.text.length > 0) {
      _nameAutoFocus = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(gm.login)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: _nameAutoFocus,
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: gm.userName,
                    hintText: gm.userNameOrEmail,
                    prefixIcon: Icon(Icons.person),
                  ),
                  // 校验用户名（不能为空）
                  validator: (v) {
                    return v.trim().isNotEmpty ? null : gm.userNameRequired;
                  }),
              TextFormField(
                controller: _pwdController,
                autofocus: !_nameAutoFocus,
                decoration: InputDecoration(
                    labelText: gm.password,
                    hintText: gm.password,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          pwdShow ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          pwdShow = !pwdShow;
                        });
                      },
                    )),
                obscureText: !pwdShow,
                //校验密码（不能为空）
                validator: (v) {
                  return v.trim().isNotEmpty ? null : gm.passwordRequired;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: _onLogin,
                    textColor: Colors.white,
                    child: Text(gm.login),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() async {
    // 提交前，先验证各个表单字段是否合法
    if ((_formKey.currentState as FormState).validate()) {
      User user;
      final hud = ProgressHUD.of(context);
      String errorMsg;
      hud.show();
      try {
        user = await Git(context).login(_unameController.text, _pwdController.text);
        // 因为登录页返回后，首页会build，所以我们传false，更新user后不触发更新
        Provider.of<UserModel>(context, listen: false).user = user;
      } catch (e) {
        //登录失败则提示
        if (e.response?.statusCode == 401) {
          errorMsg = GmLocalizations.of(context).userNameOrPasswordWrong;
        } else {
          errorMsg = e.toString();
        }
      }
      hud.dismiss();

      void showMsg (String msg) {
        hud.showWithText(msg);
        Future.delayed(Duration(seconds: 1), () {
          hud.dismiss();
        });
      }
      if (errorMsg != null) {
        showMsg(errorMsg);
        return;
      }
      if (user == null) {
        showMsg("登录失败");
        return;
      }

      hud.showWithText("登录成功");
      Future.delayed(Duration(seconds: 1), () {
        hud.dismiss();
        Navigator.of(context).pop();
      });
    }
  }
}