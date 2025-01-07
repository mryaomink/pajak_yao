import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KursPajakPage extends StatelessWidget {
  const KursPajakPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(
          'https://fiskal.kemenkeu.go.id/informasi-publik/kurs-pajak'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kurs Pajak'),
        backgroundColor: const Color(0xFF0C0060),
        foregroundColor: Colors.white,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
