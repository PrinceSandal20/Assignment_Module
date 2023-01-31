import 'package:flutter/material.dart';
import 'package:show_more_text_popup/show_more_text_popup.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Show more text',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  static const String description =
      "The Taj Mahal is an ivory-white marble mausoleum on the south bank of the Yamuna river in the Indian city of Agra.";

  // final String description =
  //     "This is the description with no context. This is Popup which can be appears when show more is clicked.";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            "Popup",
          ),
        ),
      ),
      body: ClipRRect(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://www.planetware.com/wpimages/2020/01/india-in-pictures-beautiful-places-to-photograph-taj-mahal.jpg',
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                DescriptionTextWidget(
                  text: description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  const DescriptionTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;
  GlobalKey key = GlobalKey();
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 40) {
      firstHalf = widget.text.substring(0, 40);
      secondHalf = widget.text.substring(40, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Row(
              children: <Widget>[
                //Text(firstHalf + " "),
                InkWell(
                  key: const Key("show_more_ink_well"),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Taj Mahal",
                        key: key,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  onTap: () {
                    showMoreText(widget.text);
                  },
                ),
              ],
            ),
    );
  }

  void showMoreText(String text) {
    ShowMoreTextPopup popup = ShowMoreTextPopup(context,
        text: text,
        textStyle: const TextStyle(color: Colors.black),
        height: 100,
        width: 100,
        backgroundColor: Color.fromARGB(255, 137, 205, 187),
        padding: const EdgeInsets.all(4.0),
        borderRadius: BorderRadius.circular(10.0), onDismiss: () {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Dismiss callback!")));
    });
    popup.show(
      widgetKey: key,
    );
  }
}
