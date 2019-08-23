//
// gmAvatar.dart
// flutter_demo
//
// Created by c344081 on 2019/8/24.
// Copyright © 2019 c344081. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget gmAvatar(String url, {
  double width = 30,
  double height,
  BoxFit fit,
  BorderRadius borderRadius,
}) {
  var placeholder = Image.asset(
      "imgs/avatar-default.png", //头像占位图，加载过程中显示
      width: width,
      height: height
  );
  return ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(2),
    child: CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) =>placeholder,
      errorWidget: (context, url, error) =>placeholder,
    ),
  );
}