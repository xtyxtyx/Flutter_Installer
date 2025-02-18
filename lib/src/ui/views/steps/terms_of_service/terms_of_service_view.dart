import 'package:flutter/material.dart';
import 'package:flutter_installer/src/ui/global/app_colors.dart';
import 'package:flutter_installer/src/ui/global/ui_helpers.dart';
import 'package:flutter_installer/src/ui/widgets/custom_button.dart';
import 'package:flutter_installer/src/ui/widgets/expanded_container.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:stacked/stacked.dart';

import './terms_of_service_view_model.dart';

class TermsOfServiceView extends StatelessWidget {
  final Function onAgreePressed;
  final Function onDisagreePressed;

  const TermsOfServiceView({
    @required this.onAgreePressed,
    @required this.onDisagreePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TermsOfServiceViewModel>.reactive(
      viewModelBuilder: () => TermsOfServiceViewModel(),
      builder: (
        BuildContext context,
        TermsOfServiceViewModel model,
        Widget child,
      ) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(blockSize(context) * 2),
                child: Column(
                  children: [
                    Text(
                      'Terms of Service',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: textColorBlack,
                        fontSize: blockSize(context) * 4,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ExpandedContainer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        height: blockSize(context) * 30,
                        width: blockSize(context) * 50,
                        child: Markdown(
                          data: model.markdownData,
                          styleSheet: MarkdownStyleSheet(
                            code: TextStyle(
                              fontFamily: 'RobotoMono',
                              backgroundColor: Colors.grey[350],
                              fontWeight: FontWeight.bold,
                              fontSize: blockSize(context) * 1.5,
                            ),
                            h1: TextStyle(
                              fontFamily: 'Roboto',
                              color: textColorBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: blockSize(context) * 3,
                            ),
                            p: TextStyle(
                              fontFamily: 'Roboto',
                              color: textColorBlack,
                              fontSize: blockSize(context) * 1.5,
                            ),
                          ),
                          onTapLink: (String link) {
                            model.launchUrl(link);
                          },
                        ),
                      ),
                    ),
                    ExpandedContainer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          text: 'Disagree',
                          textStyle: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: blockSize(context) * 2,
                            color: textColorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                          buttonColor: dangerColor,
                          width: blockSize(context) * 15,
                          onPressed: () {
                            onDisagreePressed();
                          },
                        ),
                        CustomButton(
                          text: 'Agree',
                          textStyle: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: blockSize(context) * 2,
                            color: textColorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                          buttonColor: primaryColor,
                          width: blockSize(context) * 15,
                          onPressed: () {
                            // TODO(yazeed): Save the user's acceptance of the Terms of Service/EULA to the memory
                            onAgreePressed();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
