import 'package:flutter/material.dart';
import 'package:skooled/utilities/sizingInformation.dart';
import 'package:skooled/utilities/ui_utils.dart';

class BaseWidget extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInformation sizingInformation) builder;
  const BaseWidget({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return LayoutBuilder(
      builder: (context, boxConstriants) {
        var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          localWidgetSize: Size(boxConstriants.maxWidth, boxConstriants.maxHeight)
        );
        return builder(context, sizingInformation);
      },
    );
  }

}