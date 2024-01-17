// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:new_maps/otp.dart';
// import '../repository/Auth.dart';

// class LoginScreen extends ConsumerWidget {
//   final TextEditingController _controller = TextEditingController();
//   LoginScreen({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final auth = ref.watch(authProvider);
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Phone Auth'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Expanded(
//               flex: 1,
//               // margin: EdgeInsets.only(top: 60),
//               child: Center(
//                 child: Text(
//                   'Phone Authentication',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               // margin: EdgeInsets.only(top: 40, right: 10, left: 10),
//               child: TextField(
//                 decoration: const InputDecoration(
//                   hintText: 'Phone Number',
//                   prefix: Padding(
//                     padding: EdgeInsets.all(4),
//                     child: Text(
//                       '+967',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 maxLength: 10,
//                 keyboardType: TextInputType.number,
//                 controller: _controller,
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               // margin: EdgeInsets.all(10),
//               // width: double.infinity,
//               child: TextButton(
//                 onPressed: () async {
//                   await auth.authenticate(
//                       // phoneNumber: '+967${_controller.text.trim()}');
//                       // phoneNumber: '+9647514409284');
//                       phoneNumber: '+967770234262');
//                   print('It is done  ');
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => OTPScreen(phone:  _controller.text.trim().toString() ,)));
//                 },
//                 child: const Text(
//                   'Next',
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20,
//                       backgroundColor: Colors.blueAccent),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
