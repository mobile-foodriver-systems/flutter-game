// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:food_driver/core/ui/colors/app_colors.dart';
// import 'package:sms_autofill/sms_autofill.dart';

// class ConfirmationCodeField extends StatelessWidget {
//   final int codeLength;
//   final double codeFieldHeight;
//   final TextEditingController controller;
//   final double gapSpace;
//   final String errorText;
//   final bool wrongCode;
//   final Function(String)? onCodeSubmitted;
//   final Function(String?)? onCodeChanged;
//   final FocusNode focusNode;
//   final bool isLoading;
//   final String? currentCode;
//   final Cursor? cursor;
//   final List<TextInputFormatter>? inputFormatters;

//   const ConfirmationCodeField({
//     super.key,
//     required this.codeLength,
//     required this.codeFieldHeight,
//     required this.controller,
//     required this.gapSpace,
//     required this.errorText,
//     required this.wrongCode,
//     this.onCodeSubmitted,
//     this.onCodeChanged,
//     required this.focusNode,
//     required this.isLoading,
//     this.currentCode,
//     this.cursor,
//     this.inputFormatters,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         _buildCodeField(context),
//         if (wrongCode && !isLoading) _buildErrorText(context),
//       ],
//     );
//   }

//   Widget _buildCodeField(BuildContext context) {
//     final isError = wrongCode &&
//         controller.text.isEmpty &&
//         !focusNode.hasFocus &&
//         !isLoading;
//     return SizedBox(
//       height: codeFieldHeight,
//       child: PinFieldAutoFill(
//         controller: controller,
//         codeLength: codeLength,
//         autoFocus: true,
//         decoration: BoxLooseDecoration(
//           strokeColorBuilder: isError
//               ? const FixedColorBuilder(AppColors.primary)
//               : const FixedColorBuilder(Colors.transparent),
//           radius: const Radius.circular(8.0),
//           bgColorBuilder: const FixedColorBuilder(AppColors.pinCodeGray),
//           textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                 color: AppColors.pinCodeGray,
//                 fontWeight: FontWeight.w500,
//               ),
//           gapSpace: gapSpace,
//         ),
//         onCodeSubmitted: onCodeSubmitted,
//         onCodeChanged: onCodeChanged,
//         focusNode: focusNode,
//         currentCode: currentCode,
//         cursor: cursor,
//         inputFormatters: inputFormatters,
//       ),
//     );
//   }

//   Widget _buildErrorText(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: controller,
//       builder: (BuildContext context, TextEditingValue value, Widget? child) {
//         if (value.text.isEmpty) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Text(
//               errorText,
//               style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                     fontWeight: FontWeight.w500,
//                     color: AppColors.red,
//                   ),
//             ),
//           );
//         }
//         return const SizedBox();
//       },
//     );
//   }
// }
