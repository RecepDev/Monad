import 'package:flutter/material.dart';
import 'package:monad/extensions/enums/enums.dart';

class MonadProvider extends ChangeNotifier {
  bool _isSkletonizerWorking = true;
  late whichPage _currentPage;
  bool get isSkletonizerWorking => _isSkletonizerWorking;
  whichPage get getcurrentPage => _currentPage;

  void changeSkeleton(bool newValue) async {
    _isSkletonizerWorking = newValue;

    notifyListeners();
  }

  void changePage(whichPage newValue) async {
    _currentPage = newValue;

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
