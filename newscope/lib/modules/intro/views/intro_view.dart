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
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Obx(
                () => AnimatedOpacity(
                  duration: const Duration(milliseconds: 900),
                  opacity: controller.showContent.value ? 1 : 0,
                  child: AnimatedSlide(
                    duration: const Duration(milliseconds: 900),
                    offset: controller.showContent.value
                        ? Offset.zero
                        : const Offset(0, .08),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: OutlinedButton.icon(
                            onPressed: controller.openDashboard,
                            icon: const Icon(Icons.dashboard_customize),
                            label: const Text('العودة إلى لوحة التحكم'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.paperWhite,
                              side: BorderSide(
                                color: AppColors.paperWhite.withValues(
                                  alpha: 0.18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(28),
                          decoration: App3dStyles.panelDecoration(
                            tone: App3dTone.glass,
                            radius: 34,
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final isWide = constraints.maxWidth >= 960;

                              final copy = Column(
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
                                      fontSize: 40,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'افتتاحية مستوحاة من قاعة بث حديثة، بخطوط ضوء عالمية، وحضور بصري يوازن بين الرسمية والحداثة.',
                                    style: AppTextStyles.body.copyWith(
                                      color: AppColors.softGray,
                                    ),
                                  ),
                                  const SizedBox(height: 22),
                                  Wrap(
                                    spacing: 12,
                                    runSpacing: 12,
                                    children: controller.openingNotes
                                        .map(
                                          (note) => Container(
                                            constraints: const BoxConstraints(
                                              minWidth: 220,
                                              maxWidth: 340,
                                            ),
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              color: Colors.white.withValues(
                                                alpha: 0.06,
                                              ),
                                              border: Border.all(
                                                color: Colors.white.withValues(
                                                  alpha: 0.08,
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              note,
                                              style: AppTextStyles.caption
                                                  .copyWith(
                                                color: AppColors.paperWhite,
                                                height: 1.8,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: controller.openHeadlines,
                                        icon: const Icon(Icons.play_arrow),
                                        label: const Text('بدء العناوين'),
                                      ),
                                      const SizedBox(width: 12),
                                      Custom3dBadge(
                                        label:
                                            'انتقال تلقائي خلال ${controller.countdown.value} ثوان',
                                        icon: Icons.timer_outlined,
                                        backgroundColor:
                                            Colors.white.withValues(alpha: 0.10),
                                        foregroundColor: AppColors.paperWhite,
                                      ),
                                    ],
                                  ),
                                ],
                              );

                              final visual = Column(
                                children: [
                                  Custom3dReveal(
                                    delay: const Duration(milliseconds: 80),
                                    child: const Custom3dMediaFrame(
                                      title: 'خريطة العالم التفاعلية',
                                      subtitle:
                                          'مساحة عرض افتتاحية تحاكي واجهات البث الدولي ومراكز المتابعة العالمية.',
                                      icon: Icons.public_outlined,
                                      badge: 'افتتاح البث',
                                      tone: App3dTone.dark,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Container(
                                    padding: const EdgeInsets.all(18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: Colors.white.withValues(alpha: 0.06),
                                      border: Border.all(
                                        color: Colors.white.withValues(alpha: 0.08),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.hub_outlined,
                                          color: AppColors.paperWhite,
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            'خطوط الربط الضوئية بين المكاتب تعزز الإحساس بمشهد افتتاحي متصل ومتعدد الطبقات.',
                                            style: AppTextStyles.body.copyWith(
                                              color: AppColors.softGray,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                              if (!isWide) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    copy,
                                    const SizedBox(height: 20),
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
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
