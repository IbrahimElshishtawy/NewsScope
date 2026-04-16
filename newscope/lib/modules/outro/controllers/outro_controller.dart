import 'package:get/get.dart';
import 'package:newscope/data/repositories/news_content_repository.dart';
import 'package:newscope/routes/app_routes.dart';

class OutroController extends GetxController {
  OutroController({required NewsContentRepository repository})
    : _repository = repository;

  final NewsContentRepository _repository;

  List<String> get tickerItems => [
    'شكراً لمتابعتكم هذه النشرة',
    'يمكن العودة إلى اللوحة الرئيسية لاختيار أي فقرة مرة أخرى',
    _repository.getHomeTickerItems().first,
  ];

  List<String> get closingNotes => const [
    'ختام هادئ يترك مساحة بصرية نظيفة لشعار البرنامج ورسالة الشكر.',
    'زر العودة يعيد المستخدم مباشرة إلى لوحة التحكم الرئيسية عبر GetX.',
    'الواجهة مصممة لتكون مناسبة لنهاية نشرة رسمية أو فقرة أخيرة داخل التطبيق.',
  ];

  void backToDashboard() {
    Get.offNamed(AppRoutes.home);
  }
}
