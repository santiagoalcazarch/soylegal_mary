import 'package:flutter/material.dart';

void navigateToNewScreen(BuildContext context, Widget widget){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => widget
    )
  );
}