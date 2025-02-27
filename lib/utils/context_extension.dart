import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/onboarding/onboarding.dart';

extension ContextExtension on BuildContext {

void navigateReplacementTo (Widget widget){


  Navigator.pushReplacement(this, MaterialPageRoute(builder: (context)=> widget));
}

}