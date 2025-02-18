import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_installer/src/ui/global/ui_helpers.dart';
import 'package:flutter_installer/src/ui/global/app_colors.dart';
import 'package:flutter_installer/src/ui/views/startup/startup_view_model.dart';

class StartupView extends StatefulWidget {
  @override
  _StartupViewState createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      viewModelBuilder: () => StartupViewModel(),
      onModelReady: (StartupViewModel model) => model.handleStartup(),
      builder: (
        BuildContext context,
        StartupViewModel model,
        Widget child,
      ) {
        model.initializeWindowSize();

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo_flutter_1080px_clr.png',
                  width: blockSize(context) * 15,
                ),
                SizedBox(
                  height: blockSize(context) * 5,
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(primaryColor),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
