import 'package:flutter/material.dart';

class MonadProvider extends ChangeNotifier {
  bool _isSkletonizerWorking = true;
  bool get isSkletonizerWorking => _isSkletonizerWorking;



  void changeSkeleton(bool newValue){
    _isSkletonizerWorking = newValue;
    notifyListeners();
  }
}
