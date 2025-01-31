part of driven_components_module;
// import 'package:driven_common/common/semantic_strings.dart';
// import 'package:flutter/material.dart';

// class PasswordRulesIcon extends StatelessWidget {
//   final ScrollController? scrollController;
//   final double? animateOffset;
//   const PasswordRulesIcon({
//     this.scrollController,
//     this.animateOffset,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Semantics(
//         container: true,
//         label: SemanticStrings.showPasswordRule,
//         child: GestureDetector(
//           onTap: () => _onImageClick(context),
//           child: _questionMarkImage(),
//         ));
//   }

//   Future<void> _onImageClick(BuildContext context) async {
//     await scrollToTop();
//     FocusScope.of(context).requestFocus(FocusNode());
//     await showAlignedDialog(
//       context: context,
//       builder: PasswordRuleDialog().localDialogBuilder,
//       followerAnchor: Alignment.topLeft,
//       targetAnchor: Alignment.bottomLeft,
//     );
//   }

//   Widget _questionMarkImage() {
//     if (AppUtils.isCardHolderLogin) {
//       return const Icon(
//         Icons.help,
//         size: 24,
//         color: DrivenColors.black,
//       );
//     } else {
//       return Padding(
//         padding: const EdgeInsets.only(right: 4),
//         child: Image.asset(
//           AdminAssets.questionMarkIcon,
//           height: 20,
//           width: 20,
//         ),
//       );
//     }
//   }

//   Future<void> scrollToTop() async {
//     await scrollController?.animateTo(
//       animateOffset ?? 0,
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.linear,
//     );
//   }
// }
