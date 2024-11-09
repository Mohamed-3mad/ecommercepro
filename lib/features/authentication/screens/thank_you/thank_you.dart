// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class ThankYouContainer extends StatelessWidget {
//   const ThankYouContainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: ShapeDecoration(
//         color: const Color(0xFFEDEDED),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20),
//         ),
//       ),
//       child: Padding(
//         padding:
//             const EdgeInsets.only(top: 66, left: 22, right: 22), //radius +16
//         child: Column(
//           children: [
//             const Text(
//               "Thank You!",
//               textAlign: TextAlign.center,
//               style: Styles.style25,
//             ),
//             Text(
//               "Your transaction was successful",
//               textAlign: TextAlign.center,
//               style: Styles.style20,
//             ),
//             const SizedBox(height: 42),
//             const PaymentItemInfo(text: "Date", value: "01/24/2023"),
//             const SizedBox(height: 20),
//             const PaymentItemInfo(text: "Time", value: "10:15 AM"),
//             const SizedBox(height: 20),
//             const PaymentItemInfo(text: "To", value: "Sam Louis"),
//             const Divider(
//               height: 60,
//               thickness: 3,
//             ),
//             const TotalPrice(text: "Total", value: "\$50.97"),
//             const SizedBox(height: 30),
//             const CardInfoWidget(),
//             const Spacer(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SvgPicture.asset("assets/images/barcode.svg"),
//                 Container(
//                   width: 113,
//                   height: 58,
//                   decoration: ShapeDecoration(
//                     shape: RoundedRectangleBorder(
//                       side: const BorderSide(
//                           width: 1.50, color: Color(0xff34a853)),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text("PAID",
//                         textAlign: TextAlign.center,
//                         style: Styles.style24
//                             .copyWith(color: const Color(0xff34a853))),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//                 height: (MediaQuery.sizeOf(context).height * .22 / 2) -
//                     29), //29-> half height row
//           ],
//         ),
//       ),
//     );
//   }
// }
