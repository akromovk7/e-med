import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_app/core/base/size_extension.dart';
import 'package:med_app/core/components/text_styles.dart';
import 'package:med_app/core/constants/color_const.dart';
import 'package:med_app/core/constants/font_const.dart';
import 'package:med_app/core/constants/radius_const.dart';

class NumInWidget extends StatelessWidget {
  const NumInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.070,
      width: context.width * 0.130,
      margin: EdgeInsets.only(right: context.width * 0.020),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: ConsColors.kBlack.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(ConsRadius.small)),
      child: TextFormField(
        autocorrect: true,
        onChanged: ((value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        }),
        style: TextCustom.textDesign(fontsize: FontConst.kMedLarge),
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.number,
        decoration:
            const InputDecoration(border: InputBorder.none, hintText: '0'),
      ),
    );
  }
}
