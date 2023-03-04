import 'package:flutter/material.dart';

import '../../Locale/locale.dart';
import '../../Theme/style.dart';

class DoubleBackToCloseWidget extends StatefulWidget {
  final Widget child; // Make Sure this child has a Scaffold widget as parent.

  const DoubleBackToCloseWidget({
    required this.child,
  });

  @override
  _DoubleBackToCloseWidgetState createState() =>
      _DoubleBackToCloseWidgetState();
}

class _DoubleBackToCloseWidgetState extends State<DoubleBackToCloseWidget> {
  int _lastTimeBackButtonWasTapped=0;
  static const exitTimeInMillis = 2000;

  bool get _isAndroid => Theme.of(context).platform == TargetPlatform.android;

  @override
  Widget build(BuildContext context) {
    if (_isAndroid) {
      return WillPopScope(
        onWillPop: _handleWillPop,
        child: widget.child,
      );
    } else {
      return widget.child;
    }
  }

  Future<bool> _handleWillPop() async {
    final _currentTime = DateTime.now().millisecondsSinceEpoch;

    if (_lastTimeBackButtonWasTapped != null &&
        (_currentTime - _lastTimeBackButtonWasTapped) < exitTimeInMillis) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      return true;
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      ScaffoldMessenger.of(context).removeCurrentSnackBar();


      ScaffoldMessenger.of(context).showSnackBar(
        _getExitSnackBar(context),
      );
      return false;
    }
  }

  SnackBar _getExitSnackBar(
      BuildContext context,
      ) {
    var locale = AppLocalizations.of(context)!;
    return  SnackBar(
      content: Text(
        "انقر مرة أخرى للخروج",
        style: blackBoldTextStyle(fontSize: 12, context: context),

      ),
      backgroundColor: Colors.red,
      duration: const Duration(
        seconds: 2,
      ),
      behavior: SnackBarBehavior.floating,
    );
  }
}