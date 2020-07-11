import 'package:flutter/material.dart';
import 'package:flutter_installer/src/app/generated/locator/locator.dart';
import 'package:flutter_installer/src/app/generated/router/router.gr.dart';
import 'package:flutter_installer/src/ui/global/app_colors.dart';
import 'package:flutter_installer/src/ui/global/ui_helpers.dart';
import 'package:flutter_installer/src/ui/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import './home_view_model.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget child,
      ) {
        model.initializeWindowSize();

        return Scaffold(
          body: SafeArea(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Opacity(
                      opacity: 0.15,
                      child: Image.asset(
                        'assets/images/logo_flutter_1080px_clr.png',
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(blockSize(context)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(),
                          ),
                          CustomButton(
                            text: 'FAQ',
                            onPressed: () {
                              locator<NavigationService>()
                                  .navigateTo(Routes.faqView);
                            },
                            width: 150,
                          ),
                          FlutterLogo(
                            size: blockSize(context) * 15,
                          ),
                          verticalSpaceSmall(context),
                          Text(
                            'Flutter Installer',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoMono(
                              color: textColorBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: blockSize(context) * 3,
                            ),
                          ),
                          verticalSpaceSmall(context),
                          CustomButton(
                            onPressed: () {},
                            text: 'Get Started',
                            width: blockSize(context) * 30,
                            textStyle: GoogleFonts.roboto(
                              color: textColorWhite,
                              fontWeight: FontWeight.bold,
                              fontSize: blockSize(context) * 3,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            'Made With Flutter 💙',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoMono(
                              color: textColorBlack,
                              fontSize: blockSize(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
