import 'package:ek_sheba/src/common/utils/logger.dart';
import 'package:ek_sheba/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'auth/auth_hanlder.dart';
import 'domain/entities/session_param.dart';

class HtmlPDFDashboard extends StatefulWidget {
  const HtmlPDFDashboard({super.key});
  static const routeName = '/html_pdf_dashboard';

  // final SeasonParams param;

  @override
  State<HtmlPDFDashboard> createState() => _HtmlPDFDashboardState();
}

class _HtmlPDFDashboardState extends State<HtmlPDFDashboard> {
  late final controller = WebViewController();
  int progress = 0;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  _showErrDialog({String? msg}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text('Something went wrong $msg'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }

  _initController() async {
    // final response = await locator.get<PDfHandler>().getPDFUrl(param);

    // if (response == null) {
    //   logger.e('response is null');
    //   _showErrDialog();
    //   return;
    // }

    final uri = Uri.parse(
        'https://ppstraining.plandiv.gov.bd/dpp-tapp/public-dashboard?id=b886f8dc-5282-4a67-816c-bf95272d3265&p=f73b9698-f099-4746-ad5b-f15c35330213');
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(uri)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (uri) {
          setState(() {
            progress = 0;
          });
        },
        onProgress: (v) {
          setState(() {
            progress = v;
          });
        },
        onPageFinished: (uri) {
          setState(() {
            progress = 100;
          });
        },
        onWebResourceError: (error) {
          _showErrDialog(msg: error.description);
          print('onWebResourceError: $error');
        },
      ))
      ..canGoBack().then((value) => print(value));
  }

  _onSpecificClass(String name) async {
    logger.d('onSpecificClass: $name');
    setState(() {});
  }
  

  @override
  Widget build(BuildContext context) {
    var stack = Stack(
      children: [
        WebViewWidget(
          controller: controller,
        ),
        if (progress < 100)
          LinearProgressIndicator(
            value: progress / 100.0,
          ),
      ],
    );
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _onSpecificClass('detail-header-content-block'),
      // ),
      body: SafeArea(
          child: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse("https://ppstraining.plandiv.gov.bd/dpp-tapp/public-dashboard?id=b886f8dc-5282-4a67-816c-bf95272d3265&p=f73b9698-f099-4746-ad5b-f15c35330213")),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useOnDownloadStart: true,
            javaScriptEnabled: true,
          ),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          
        },
    
       
        onDownloadStartRequest: (controller, DownloadStartRequest url) async {
          print("onDownloadStart $url");
          final taskId = await FlutterDownloader.enqueue(
            url: url.url.path,
            savedDir: (await getExternalStorageDirectory())!.path,
            showNotification: true, // show download progress in status bar (for Android)
            openFileFromNotification: true, // click on notification to open downloaded file (for Android)
          );
        },
      )),
    );
  }
}
