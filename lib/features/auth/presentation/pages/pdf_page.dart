import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/game/presentation/widgets/loading_indicator.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part 'package:food_driver/features/auth/presentation/pages/mixins/pdf_mixin.dart';

class PdfPage extends StatefulWidget {
  final String url;
  final String? title;

  const PdfPage({
    super.key,
    required this.url,
    this.title,
  });

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> with PdfMixin {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.white),
      child: SafeArea(
        child: Scaffold(
          appBar: widget.title?.isEmpty ?? true
              ? null
              : AppBar(
                  title: Text(
                    widget.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
          body: isLoading
              ? const LoadingIndicator()
              : PDFView(filePath: filePath),
        ),
      ),
    );
  }
}
