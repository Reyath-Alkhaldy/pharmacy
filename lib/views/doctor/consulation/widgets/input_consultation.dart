// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';

// class ChatScreenInput extends StatelessWidget {
//   const ChatScreenInput({super.key});

   
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: context.theme.scaffoldBackgroundColor,
//       height: kBottomNavigationBarHeight,
//       width: context.width,
//       child: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: 10),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(
//               flex: 3,
//               child: TextFormField(
//                 onFieldSubmitted:(string){

//                 } ,
//                 // focusNode: controller.focusNode,
//                 decoration: InputDecoration(
//                   filled: false,
//                   label: 
//                 ),
                
//               ),
//             ),
//             Gap(5),
//             Expanded(
//               child: ElevatedButton(
//                 // onPressed: () => controller.sendMessege(context),
//                 onPressed: () {  },
//                 child: Text('Send'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }