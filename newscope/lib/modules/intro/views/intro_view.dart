import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_background.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_media_frame.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/modules/intro/controllers/intro_controller.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Custom3dBackground(
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, viewport) {
                final isCompactWidth = viewport.maxWidth < 640;
                final useScrollableLayout =
                    viewport.maxHeight < 820 || isCompactWidth;
                final pagePadding = EdgeInsets.all(isCompactWidth ? 16 : 24);

                return Obx(
                  () => AnimatedOpacity(
                    duration: const Duration(milliseconds: 900),
                    opacity: controller.showContent.value ? 1 : 0,
                    child: AnimatedSlide(
                      duration: const Duration(milliseconds: 900),
                      offset: controller.showContent.value
                          ? Offset.zero
                          : const Offset(0, .08),
                      child: useScrollableLayout
                          ? SingleChildScrollView(
                              padding: pagePadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDashboardAction(),
                                  SizedBox(height: isCompactWidth ? 20 : 28),
                                  _buildHeroSection(isCompactWidth),
                                ],
                              ),
                            )
                          : Padding(
                              padding: pagePadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildDashboardAction(),
                                  const Spacer(),
                                  _buildHeroSection(isCompactWidth),
                                  const Spacer(),
                                ],
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardAction() {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: OutlinedButton.icon(
        onPressed: controller.openDashboard,
        icon: const Icon(Icons.dashboard_customize),
        label: const Text('العودة إلى لوحة التحكم'),
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.paperWhite,
          side: BorderSide(color: AppColors.paperWhite.withValues(alpha: 0.18)),
        ),
      ),
    );
  }

  Widget _buildHeroSection(bool isCompactWidth) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isCompactWidth ? 20 : 28),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.glass,
        radius: 34,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 1040;
          final sectionGap = isCompactWidth ? 18.0 : 24.0;
          final copy = _buildCopySection(
            isCompactWidth: isCompactWidth,
            availableWidth: constraints.maxWidth,
          );
          final visual = _buildVisualSection(isCompactWidth: isCompactWidth);

          if (!isWide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                copy,
                SizedBox(height: sectionGap),
                visual,
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 6, child: copy),
              const SizedBox(width: 24),
              Expanded(flex: 5, child: visual),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCopySection({
    required bool isCompactWidth,
    required double availableWidth,
  }) {
    final titleSize = isCompactWidth ? 32.0 : 40.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final noteWidth = constraints.maxWidth < 480
            ? constraints.maxWidth
            : (constraints.maxWidth / 2).clamp(220.0, 320.0).toDouble();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Custom3dBadge(
              label: 'المشهد الافتتاحي',
              icon: Icons.language,
              backgroundColor: Color(0x22FFFFFF),
              foregroundColor: AppColors.paperWhite,
            ),
            const SizedBox(height: 18),
            Text(
              'النشرة الرئيسية',
              style: AppTextStyles.masthead.copyWith(
                color: AppColors.paperWhite,
                fontSize: titleSize,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'افتتاحية مستوحاة من قاعة بث حديثة، بخطوط ضوء عالمية، وحضور بصري يوازن بين الرسمية والحداثة.',
              style: AppTextStyles.body.copyWith(
                color: AppColors.softGray,
                fontSize: isCompactWidth ? 16 : 17,
              ),
            ),
            const SizedBox(height: 22),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: controller.openingNotes
                  .map(
                    (note) => SizedBox(
                      width: noteWidth,
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.white.withValues(alpha: 0.06),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.08),
                          ),
                        ),
                        child: Text(
                          note,
                          softWrap: true,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.paperWhite,
                            height: 1.8,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 24),
            _buildActionArea(availableWidth: availableWidth),
          ],
        );
      },
    );
  }

  Widget _buildActionArea({required double availableWidth}) {
    final countdownLabel =
        'انتقال تلقائي خلال ${controller.countdown.value} ثوان';

    return LayoutBuilder(
      builder: (context, constraints) {
        final shouldStack = constraints.maxWidth < 520;

        if (shouldStack) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: controller.openHeadlines,
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('بدء العناوين'),
                ),
              ),
              const SizedBox(height: 12),
              _buildCountdownChip(
                label: countdownLabel,
                maxWidth: constraints.maxWidth,
              ),
            ],
          );
        }

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: controller.openHeadlines,
              icon: const Icon(Icons.play_arrow),
              label: const Text('بدء العناوين'),
            ),
            _buildCountdownChip(
              label: countdownLabel,
              maxWidth: availableWidth > 880 ? 320 : constraints.maxWidth,
            ),
          ],
        );
      },
    );
  }

  Widget _buildCountdownChip({
    required String label,
    required double maxWidth,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white.withValues(alpha: 0.10),
          border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.timer_outlined,
              color: AppColors.paperWhite,
              size: 18,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                softWrap: true,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.paperWhite,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisualSection({required bool isCompactWidth}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom3dReveal(
          delay: const Duration(milliseconds: 80),
          child: Custom3dMediaFrame(
            title: 'خريطة العالم التفاعلية',
            subtitle:
                'مساحة عرض افتتاحية تحاكي واجهات البث الدولي ومراكز المتابعة العالمية.',
            icon: Icons.public_outlined,
            badge: 'افتتاح البث',
            tone: App3dTone.dark,
            aspectRatio: isCompactWidth ? 4 / 3 : 16 / 9,
          ),
        ),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(isCompactWidth ? 16 : 18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white.withValues(alpha: 0.06),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(Icons.hub_outlined, color: AppColors.paperWhite),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'خطوط الربط الضوئية بين المكاتب تعزز الإحساس بمشهد افتتاحي متصل ومتعدد الطبقات.',
                  softWrap: true,
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.softGray,
                    fontSize: isCompactWidth ? 14 : 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
