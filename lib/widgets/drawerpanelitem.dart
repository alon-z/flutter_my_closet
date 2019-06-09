import 'package:flutter/material.dart';

class DrawerPanelItem {
  Widget body;
  Widget header;
  bool isExpended;
  DrawerPanelItem({this.isExpended: false, this.body, this.header});
}