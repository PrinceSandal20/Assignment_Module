

// import 'package:flutter/material.dart';
// import 'package:show_more_text_popup/show_more_text_popup.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Show more text',
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   static const String description =
//       "This is the description with no context. This is Popup which can be appears when show more is clicked.";

//   // final String description =
//   //     "This is the description with no context. This is Popup which can be appears when show more is clicked.";

//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         shadowColor: Colors.black,
//         title: const Center(
//           child: Text(
//             "Text Popup",
//             //style: TextStyle(color: Colors.white),
//           ),
//         ),
//       ),
//       body: ClipRRect(
//         child: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: NetworkImage(
//                 'https://www.kindacode.com/wp-content/uploads/2021/01/blue.jpg',
//               ),
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(25),
//             child: Column(
//               children: [
//                 DescriptionTextWidget(
//                   text: description,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DescriptionTextWidget extends StatefulWidget {
//   final String text;

//   const DescriptionTextWidget({Key? key, required this.text}) : super(key: key);

//   @override
//   _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
// }

// class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
//   late String firstHalf;
//   late String secondHalf;
//   GlobalKey key = GlobalKey();
//   bool flag = true;

//   @override
//   void initState() {
//     super.initState();

//     if (widget.text.length > 40) {
//       firstHalf = widget.text.substring(0, 40);
//       secondHalf = widget.text.substring(40, widget.text.length);
//     } else {
//       firstHalf = widget.text;
//       secondHalf = "";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//       child: secondHalf.isEmpty
//           ? Text(firstHalf)
//           : Row(
//               children: <Widget>[
//                 Text(firstHalf + " "),
//                 InkWell(
//                   key: const Key("show_more_ink_well"),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
//                         "Information",
//                         key: key,
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                   onTap: () {
//                     showMoreText(widget.text);
//                   },
//                 ),
//               ],
//             ),
//     );
//   }

//   void showMoreText(String text) {
//     ShowMoreTextPopup popup = ShowMoreTextPopup(context,
//         text: text,
//         textStyle: const TextStyle(color: Colors.black),
//         height: 200,
//         width: 100,
//         backgroundColor: const Color(0xFF16CCCC),
//         padding: const EdgeInsets.all(4.0),
//         borderRadius: BorderRadius.circular(10.0), onDismiss: () {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text("Dismiss callback!")));
//     });
//     popup.show(
//       widgetKey: key,
//     );
//   }
// }
