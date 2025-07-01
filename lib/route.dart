import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/GetData.dart';
import 'package:getx/TitlePage.dart';

List<GetPage> allPages = [
  GetPage(
      name: "/title",
      page: () => Titlepage(),
      transition: Transition.leftToRight,

  ),
  GetPage(
    name: "/getData",
    page: () => GetData(),
    transition: Transition.leftToRight,
  ),


];
