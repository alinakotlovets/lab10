import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String text;
  final double fontSize;

  const SecondScreen({
    super.key,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: _buildBodyContent(context),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Preview'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPreviewText(),
        const SizedBox(height: 32),
        _buildActionButtons(context),
      ],
    );
  }

  Widget _buildPreviewText() {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context, 'ok'),
          child: const Text('Ok'),
        ),
        const SizedBox(width: 16),
        OutlinedButton(
          onPressed: () => Navigator.pop(context, 'cancel'),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
