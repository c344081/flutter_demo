//
// _localization.dart
// flutter_demo
//
// Created by c344081 on 2019/8/23.
// Copyright © 2019 c344081. All rights reserved.
//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Locale资源类
class GmLocalizations {
  GmLocalizations(this.isZh);

  bool isZh = false;

  static GmLocalizations of(BuildContext context) {
    return Localizations.of<GmLocalizations>(context, GmLocalizations);
  }

  String get title {
    return isZh ? "Github应用" : "Github Demo";
  }

  String get home {
    return isZh ? "首页" : "Home";
  }

  String get login {
    return isZh ? "登录" : "Login";
  }

  String get noDescription {
    return isZh ? "暂无描述" : "NO Description";
  }
}

//Locale代理类
class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  const GmLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<GmLocalizations> load(Locale locale) {
    print("xxxx$locale");
    return  SynchronousFuture<GmLocalizations>( GmLocalizations(locale.languageCode == "zh"));
  }

  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(GmLocalizationsDelegate old) => false;
}
