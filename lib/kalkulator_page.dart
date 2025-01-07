import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KalkulatorPage extends StatelessWidget {
  const KalkulatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://kalkulator.pajak.go.id/'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator Pajak'),
        backgroundColor: const Color(0xFF0C0060),
        foregroundColor: Colors.white,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
