import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    super.key,
    required this.url,
    this.title,
  });

  final String url;
  final String? title;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController controller;
  bool isLoading = false;

  @override
  void initState() {
    controller = WebViewController();
    final uri = Uri.tryParse(widget.url);
    if (uri == null) {
      return;
    }
    super.initState();
    prepareController(uri: uri);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.white),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: AppColors.white,
                child: WebViewWidget(controller: controller),
              ),
              if (isLoading)
                const ColoredBox(
                  color: AppColors.white,
                  child: LoadingIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> prepareController({required Uri uri}) async {
    isLoading = true;
    setState(() {});
    await controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    await controller.loadRequest(uri);
    isLoading = false;
    setState(() {});
  }
}
