import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF050F1C),
                AppColors.midnightBlue,
                Color(0xFF123A63),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -90,
                right: -90,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.broadcastRed.withValues(alpha: 0.22),
                  ),
                ),
              ),
              Positioned(
                left: -40,
                top: 120,
                child: Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.paperWhite.withValues(alpha: 0.07),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 28,
                top: 86,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.paperWhite.withValues(alpha: 0.12),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 180,
                child: Container(
                  height: 1,
                  color: AppColors.paperWhite.withValues(alpha: 0.12),
                ),
              ),
              Positioned(
                left: 36,
                right: 36,
                bottom: 110,
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.broadcastRed,
                        AppColors.paperWhite,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
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
                                label: const Text('العودة إلى اللوحة الرئيسية'),
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
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: AppColors.paperWhite.withValues(
                                  alpha: 0.06,
                                ),
                                border: Border.all(
                                  color: AppColors.paperWhite.withValues(
                                    alpha: 0.10,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NEWSCOPE',
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.softGray,
                                      letterSpacing: 2.4,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'نشرة الأخبار الرئيسية',
                                    style: AppTextStyles.masthead.copyWith(
                                      color: AppColors.paperWhite,
                                      fontSize: 36,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    'افتتاحية كلاسيكية بلمسة بث حديثة، بخلفية مستلهمة من الكرة الأرضية وخطوط ضوء تمنح الشاشة حضورًا رسميًا ومهيبًا.',
                                    style: AppTextStyles.body.copyWith(
                                      color: AppColors.softGray,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Wrap(
                                    spacing: 12,
                                    runSpacing: 12,
                                    children: controller.openingNotes
                                        .map(
                                          (note) => Container(
                                            constraints: const BoxConstraints(
                                              minWidth: 220,
                                              maxWidth: 360,
                                            ),
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              color: AppColors.midnightBlue
                                                  .withValues(alpha: 0.55),
                                              border: Border.all(
                                                color: AppColors.paperWhite
                                                    .withValues(alpha: 0.08),
                                              ),
                                            ),
                                            child: Text(
                                              note,
                                              style: AppTextStyles.caption
                                                  .copyWith(
                                                    color: AppColors.paperWhite,
                                                    height: 1.6,
                                                  ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  const SizedBox(height: 28),
                                  Row(
                                    children: [
                                      ElevatedButton.icon(
                                        onPressed: controller.openHeadlines,
                                        icon: const Icon(Icons.play_arrow),
                                        label: const Text('بدء النشرة'),
                                      ),
                                      const SizedBox(width: 12),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            999,
                                          ),
                                          color: AppColors.paperWhite
                                              .withValues(alpha: 0.08),
                                        ),
                                        child: Text(
                                          'انتقال تلقائي خلال ${controller.countdown.value} ثوانٍ',
                                          style: AppTextStyles.caption.copyWith(
                                            color: AppColors.paperWhite,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
            ],
          ),
        ),
      ),
    );
  }
}
