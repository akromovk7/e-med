import 'package:flutter/material.dart';
import 'package:med_app/core/base/size_extension.dart';
import 'package:med_app/core/components/text_styles.dart';
import 'package:med_app/core/constants/color_const.dart';
import 'package:med_app/core/constants/font_const.dart';

class AppBarWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  const AppBarWidget({
    this.onTap,
    this.text = 'Sign up',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.07,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  Icon(
                    Icons.chevron_left_outlined,
                    size: FontConst.kExtraLargeFont,
                    color: ConsColors.kPrimaryColor,
                  ),
                  Text(
                    "Back",
                    style: TextCustom.textDesign(color: ConsColors.kPrimaryColor),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Text(text, style: TextCustom.textDesign()),
            const Spacer(),
            SizedBox(
              width: context.width * 0.2,
            )
          ],
        ),
        Divider(
          color: ConsColors.kBlack,
        )
      ]),
    );
  }
}
