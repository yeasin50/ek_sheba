// import 'dart:io';
// 
// import 'package:ek_sheba/src/locator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// // Import for iOS features.
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
// 
// import '../../common/utils/logger.dart';
// import 'auth/auth_hanlder.dart';
// 
// class HtmlPDFDashboard extends StatefulWidget {
//   const HtmlPDFDashboard({
//     super.key,
//     required this.url,
//   });
// 
//   final String url;
//   static const routeName = '/html_pdf_dashboard';
// 
//   // final SeasonParams param;
// 
//   @override
//   State<HtmlPDFDashboard> createState() => _HtmlPDFDashboardState();
// }
// 
// class _HtmlPDFDashboardState extends State<HtmlPDFDashboard> {
//   WebViewController controller = WebViewController(
//     onPermissionRequest: (request) {
//       logger.d('onPermissionRequest: $request');
//     },
//   );
// 
//   int progress = 0;
//   // String? url;
// 
//   @override
//   void initState() {
//     super.initState();
//     _initController();
//   }
// 
//   _showErrDialog({String? msg}) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Error'),
//         content: Text('Something went wrong $msg'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('Ok'),
//           ),
//         ],
//       ),
//     );
//   }
// 
//   _initController() async {
//     // final response = await locator.get<PDfHandler>().getPDFUrl(param);
// 
//     // #docregion platform_features
//     late final PlatformWebViewControllerCreationParams params;
//     if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//       params = WebKitWebViewControllerCreationParams(
//         allowsInlineMediaPlayback: true,
//         mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//       );
//     } else {
//       params = const PlatformWebViewControllerCreationParams();
//     }
// 
//     controller = WebViewController.fromPlatformCreationParams(params);
// 
//     final uri = Uri.parse(widget.url);
//     controller
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..enableZoom(true)
//       ..setNavigationDelegate(NavigationDelegate(
//         onPageStarted: (uri) {
//           setState(() {
//             progress = 0;
//           });
//         },
//         onProgress: (v) {
//           setState(() {
//             progress = v;
//           });
//         },
//         onPageFinished: (uri) async {
//           try {
//             // await controller.runJavaScript(javascript);
//           } catch (_) {}
// 
//           setState(() {
//             progress = 100;
//           });
//         },
//         onWebResourceError: (error) {
//           _showErrDialog(msg: error.description);
//           logger.d('onWebResourceError: $error');
//         },
//         onNavigationRequest: (request) {
//           logger.d('onNavigationRequest: $request');
//           return NavigationDecision.navigate;
//         },
//         onUrlChange: (change) {
//           logger.d('onUrlChange: $change');
//         },
//       ))
//       ..loadRequest(uri);
//   }
// 
//   _onSpecificClass(String name) async {
//     logger.d('onSpecificClass: $name');
//     setState(() {});
//   }
// 
//   late InAppWebViewController _webViewController;
//   final options = InAppWebViewGroupOptions(
//       crossPlatform: InAppWebViewOptions(
//         useOnDownloadStart: true,
//         javaScriptEnabled: true,
//         allowFileAccessFromFileURLs: true,
//         allowUniversalAccessFromFileURLs: true,
//         javaScriptCanOpenWindowsAutomatically: true,
//         mediaPlaybackRequiresUserGesture: false,
//       ),
//       android: AndroidInAppWebViewOptions(
//         useHybridComposition: true,
//         supportMultipleWindows: true,
//       ),
//       ios: IOSInAppWebViewOptions(
//         allowsInlineMediaPlayback: true,
//       ));
// 
//   @override
//   Widget build(BuildContext context) {
//     var stack = Stack(
//       children: [
//         WebViewWidget(
//           controller: controller,
//         ),
//         if (progress < 100)
//           CircularProgressIndicator(
//             value: progress / 100.0,
//           ),
//       ],
//     );
//     var inAppWebView = InAppWebView(
//       initialUrlRequest: URLRequest(
//         url: Uri.parse(widget.url),
//       ),
//       initialOptions: options,
//       onWebViewCreated: (InAppWebViewController controller) {
//         _webViewController = controller;
//       },
//       onDownloadStartRequest: (controller, DownloadStartRequest url) async {
//         logger.d("onDownloadStartRequest $url");
//         logger.i('onDownloadStartRequest ${url.contentLength}');
//         logger.i('onDownloadStartRequest ${url.toString()}');
// 
//         Directory? tempDir = await getExternalStorageDirectory();
//         setState(() {});
//         // print("onDownload ${url.url.toString()}\n ${tempDir!.path}");
//         await FlutterDownloader.enqueue(
//           url: url.url.toString(),
//           fileName: url.suggestedFilename,
//           savedDir: tempDir!.path,
//           showNotification: true,
//           requiresStorageNotLow: false,
//           openFileFromNotification: true,
//           saveInPublicStorage: true,
//         );
//       },
//     );
// 
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Dashboard'),
//       ),
//       body: SafeArea(
//         child: stack,
//       ),
//     );
//   }
// }
