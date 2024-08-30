part of 'package:food_driver/features/auth/presentation/pages/pdf_page.dart';

mixin PdfMixin on State<PdfPage> {
  late final String filePath;
  bool isLoading = true;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    await loadPdf();
    isLoading = false;
    setState(() {});
  }

  Future<bool> loadPdf() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final filename = basename(widget.url);
      filePath = '${dir.path}/$filename';
      final pdfFile = File('${dir.path}/$filename');
      if (!pdfFile.existsSync()) {
        final request = await HttpClient().getUrl(Uri.parse(widget.url));
        final response = await request.close();
        final bytes = await consolidateHttpClientResponseBytes(response);
        await pdfFile.writeAsBytes(bytes, flush: true);
      }
      return true;
    } catch (e) {}
    return false;
  }
}
