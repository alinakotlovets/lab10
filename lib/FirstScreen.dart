import 'package:flutter/material.dart';
import 'SecondScreen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _textController = TextEditingController();
  double _fontSize = 16.0;

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: _buildDialogContent(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDialogContent(String message) {
    return SizedBox(
      width: 500,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090',
            width: 66,
          ),
          const SizedBox(height: 20),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildBodyContent(),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      centerTitle: true,
      title: const Text("Text Previewer"),
    );
  }

  Widget _buildBodyContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: _textController,
          decoration: const InputDecoration(labelText: 'Text'),
        ),
        const SizedBox(height: 24),
        _buildFontSizeLabel(),
        _buildFontSizeSlider(),
        const SizedBox(height: 24),
        _buildPreviewButton(),
      ],
    );
  }

  Widget _buildFontSizeLabel() {
    return Text(
      'Font Size: ${_fontSize.round()}',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _buildFontSizeSlider() {
    return Slider(
      value: _fontSize,
      min: 10,
      max: 100,
      divisions: 90,
      onChanged: (double value) {
        setState(() {
          _fontSize = value;
        });
      },
    );
  }

  Widget _buildPreviewButton() {
    return ElevatedButton(
      onPressed: _handlePreviewButtonPress,
      child: const Text('Preview'),
    );
  }

  Future<void> _handlePreviewButtonPress() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondScreen(
          text: _textController.text,
          fontSize: _fontSize,
        ),
      ),
    );

    if (result == 'ok') {
      _showDialog('Cool!');
    } else if (result == 'cancel') {
      _showDialog('Let\'s try something else');
    } else {
      _showDialog('Don\'t know what to say');
    }
  }
}
