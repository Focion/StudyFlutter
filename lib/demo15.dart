import 'package:flutter/material.dart';

// Define a Custom Form Widget
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

// Define a corresponding State class. This class will hold the data related to
// our Form.
class _MyFormState extends State<MyForm> {
  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final myController = TextEditingController();
  final myFoucs = FocusNode();

  @override
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    myController.removeListener(_printLatestValue);
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Field Focus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // The first text field will be focused as soon as the app starts
            TextField(
              autofocus: true,
            ),
            // The second text field will be focused when a user taps on the
            // FloatingActionButton
            TextField(
              focusNode: myFoucs,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the button is pressed, ask Flutter to focus our text field using
        // myFocusNode.
        onPressed: () => FocusScope.of(context).requestFocus(myFoucs),
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.edit),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
