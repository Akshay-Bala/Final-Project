import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


String lati='';
  String log='';
class Mapview extends StatefulWidget {
  const Mapview({super.key, this.latitude, this.longitude,});
  final latitude;
  final longitude;

  @override
  State<Mapview> createState() => _MyWidgetState();

}


class _MyWidgetState extends State<Mapview> {
  


  @override
  void initState() {
    lati=widget.latitude.toString();
    log=widget.longitude.toString();
    print('dgfhj');
    print(lati);
    super.initState();
  }
WebViewController
controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),

  
  )
  
  ..loadRequest(Uri.parse('https://www.google.com/maps?q=$lati,$log'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('View Locations')),
    body: WebViewWidget(controller: controller),
    );
  }
}