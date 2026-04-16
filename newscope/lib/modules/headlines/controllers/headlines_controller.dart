import 'package:get/get.dart';
import 'package:newscope/core/constants/section_keys.dart';
import 'package:newscope/core/controllers/broadcast_section_controller.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/routes/app_routes.dart';

class HeadlinesController extends BroadcastSectionController {
  HeadlinesController({required super.repository})
    : super(sectionKey: SectionKeys.headlines);

  String get bannerTitle => 'العناوين الرئيسية';

  String get anchorName => 'ليلى الشريف';

  String get anchorRole => 'مقدمة النشرة';

  List<ProgramStory> get stories => [section.leadStory, ...section.sideStories];

  void openMainNews() {
    Get.toNamed(AppRoutes.mainNews);
  }
}
