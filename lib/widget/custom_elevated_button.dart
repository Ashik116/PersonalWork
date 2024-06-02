// import 'package:flutter/material.dart';
//
// class CustomElevatedButton extends StatelessWidget {
//    CustomElevatedButton({Key? key,
//      this.decoration,
//      this.leftIcon,
//      this.rightIcon,
//      this.alignment,
//      EdgeInsets? margin,
//      VoidCallback? onPressed,
//      ButtonStyle? buttonStyle,
//      TextStyle? buttonTextStyle,
//      bool? isDisabled,
//      double? height,
//      double? width,
//      required  this.text,
//
//    }) : super(
//      key: key
//    );
//    final BoxDecoration? decoration;
//    final Widget? leftIcon;
//    final Widget? rightIcon;
//    final Alignment? alignment;
//    String text;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return alignment!=null ? Align(
//       alignment: alignment ?? Alignment.center,
//       child: buildElevatedButtonWidget):buildElevatedButtonWidget;
//
//   }
//   Widget get buildElevatedButtonWidget =>Container(
//     height: 61,width: double.maxFinite,
//     decoration: decoration,
//     child:  ElevatedButton(
//       style: ButtonStyle(
//         backgroundColor: Colors.orange,
//       ),
//       onPressed: (){},
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           leftIcon??SizedBox.shrink(),
//           Text(text,),
//           rightIcon ?? SizedBox.shrink(),
//         ],
//       ),
//     ),
//   );
// }
