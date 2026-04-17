import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_quote_box.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/app/widgets/custom_3d_ticker.dart';
import 'package:newscope/modules/headlines/controllers/headlines_controller.dart';
import 'package:newscope/modules/headlines/widgets/headline_item_tile.dart';
import 'package:newscope/shared/widgets/custom_app_bar.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class HeadlinesView extends GetView<HeadlinesController> {
  const HeadlinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(
          title: 'العناوين الرئيسية',
          subtitle: 'موجز افتتاحي داخل واجهة ثلاثية الأبعاد',
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 112, 20, 12),
          child: Column(
            children: [
              Custom3dReveal(child: _buildBanner()),
              const SizedBox(height: 16),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth >= 980;
                    final anchorPanel = Custom3dReveal(
                      delay: const Duration(milliseconds: 80),
                      child: _buildAnchorPanel(),
                    );
                    final headlinesPanel = Custom3dReveal(
                      delay: const Duration(milliseconds: 120),
                      child: _buildHeadlinesPanel(),
                    );

                    return isWide
                        ? Row(
                            children: [
                              Expanded(flex: 4, child: anchorPanel),
                              const SizedBox(width: 16),
                              Expanded(flex: 6, child: headlinesPanel),
                            ],
                          )
                        : Column(
                            children: [
                              Expanded(flex: 4, child: anchorPanel),
                              const SizedBox(height: 16),
                              Expanded(flex: 6, child: headlinesPanel),
                            ],
                          );
                  },
                ),
              ),
              Custom3dTicker(items: controller.tickerItems, label: 'شريط العناوين'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.accent,
        radius: 28,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Custom3dBadge(
                  label: 'موجز الافتتاح',
                  icon: Icons.view_headline_rounded,
                  backgroundColor: Color(0x22FFFFFF),
                  foregroundColor: AppColors.paperWhite,
                ),
                const SizedBox(height: 14),
                Text(
                  controller.bannerTitle,
                  style: AppTextStyles.masthead.copyWith(
                    color: AppColors.paperWhite,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'العناوين الرئيسية تظهر في طبقات مرتفعة مع فصل واضح بين مساحة المذيع ومكدس القصص الإخبارية.',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.softGray,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton(
            onPressed: controller.openMainNews,
            child: const Text('إلى الخبر الرئيسي'),
          ),
        ],
      ),
    );
  }

  Widget _buildAnchorPanel() {
    return Container(
      width: double.infinity,
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.dark,
        radius: 28,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 74,
                  height: 74,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF143861), Color(0xFF08172C)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
                  ),
                  child: const Icon(
                    Icons.mic_rounded,
                    color: AppColors.paperWhite,
                    size: 36,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.anchorName,
                        style: AppTextStyles.headline.copyWith(
                          color: AppColors.paperWhite,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        controller.anchorRole,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.softGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            Custom3dSectionHeader(
              eyebrow: 'منطقة التقديم',
              title: 'افتتاحية المذيع',
              subtitle: controller.section.quote.quote,
              trailing: const Icon(
                Icons.graphic_eq_rounded,
                color: AppColors.paperWhite,
              ),
            ),
            const SizedBox(height: 18),
            Custom3dQuoteBox(
              quote: controller.section.quote.quote,
              speaker: controller.section.quote.speaker,
              role: controller.section.quote.role,
              tone: App3dTone.glass,
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white.withValues(alpha: 0.06),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مسار القراءة',
                    style: AppTextStyles.bodyStrong.copyWith(
                      color: AppColors.paperWhite,
                    ),
                  ),
                  const SizedBox(height: 14),
                  for (final item in controller.section.agenda)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Icon(
                              Icons.fiber_manual_record_rounded,
                              size: 10,
                              color: AppColors.broadcastRed,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item,
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.paperWhite,
                                height: 1.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadlinesPanel() {
    return Container(
      width: double.infinity,
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.surface,
        radius: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(22),
            child: Custom3dSectionHeader(
              eyebrow: 'جدار العناوين',
              title: controller.section.strapline,
              subtitle:
                  'العناوين مرتبة داخل بطاقات مرتفعة لتسهيل قراءة الموجز قبل الانتقال إلى التفاصيل.',
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 22),
              itemCount: controller.stories.length,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, index) => HeadlineItemTile(
                indexLabel: '${index + 1}',
                story: controller.stories[index],
                isLead: index == 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
