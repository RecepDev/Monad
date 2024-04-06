import 'package:flutter/material.dart';

class MonadProvider extends ChangeNotifier {
  bool _isSkletonizerWorking = true;
  bool get isSkletonizerWorking => _isSkletonizerWorking;

  void changeSkeleton(bool newValue) async {
    _isSkletonizerWorking = newValue;
    
    notifyListeners();
  }

  void changeSkeletonTwice(bool newValue) async {
    _isSkletonizerWorking = newValue;
    Future.delayed(
      Duration(seconds: 2),
      () {
        _isSkletonizerWorking = !newValue;
        notifyListeners();
      },
    );
    notifyListeners();
  }
}
