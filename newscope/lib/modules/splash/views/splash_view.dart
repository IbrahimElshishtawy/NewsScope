import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/splash/controllers/splash_controller.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF051224),
                AppColors.midnightBlue,
                AppColors.studioBlue,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -120,
                left: -70,
                child: Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.paperWhite.withValues(alpha: 0.05),
                  ),
                ),
              ),
              Positioned(
                bottom: -80,
                right: -20,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.broadcastRed.withValues(alpha: 0.18),
                  ),
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        AppColors.paperWhite.withValues(alpha: 0.03),
                        Colors.transparent,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 18,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: TextButton.icon(
                          onPressed: controller.skip,
                          icon: const Icon(Icons.arrow_back_ios_new_rounded),
                          label: const Text('دخول مباشر'),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.paperWhite,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Obx(
                            () => AnimatedOpacity(
                              duration: const Duration(milliseconds: 900),
                              opacity: controller.animateIn.value ? 1 : 0,
                              child: AnimatedSlide(
                                duration: const Duration(milliseconds: 900),
                                curve: Curves.easeOutCubic,
                                offset: controller.animateIn.value
                                    ? Offset.zero
                                    : const Offset(0, .08),
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 520,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 168,
                                        height: 168,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ),
                                          border: Border.all(
                                            color: AppColors.paperWhite
                                                .withValues(alpha: 0.28),
                                          ),
                                          gradient: LinearGradient(
                                            colors: [
                                              AppColors.paperWhite.withValues(
                                                alpha: 0.16,
                                              ),
                                              AppColors.paperWhite.withValues(
                                                alpha: 0.03,
                                              ),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.broadcastRed
                                                  .withValues(alpha: 0.22),
                                              blurRadius: 42,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                              width: 108,
                                              height: 108,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: AppColors.paperWhite
                                                      .withValues(alpha: 0.22),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'NS',
                                              style: AppTextStyles.masthead
                                                  .copyWith(
                                                    fontSize: 46,
                                                    color: AppColors.paperWhite,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 28),
                                      Text(
                                        controller.channelName,
                                        style: AppTextStyles.masthead.copyWith(
                                          color: AppColors.paperWhite,
                                          letterSpacing: 1.3,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        controller.stationLabel,
                                        style: AppTextStyles.caption.copyWith(
                                          color: AppColors.softGray,
                                          letterSpacing: 2.2,
                                        ),
                                      ),
                                      const SizedBox(height: 18),
                                      Text(
                                        controller.subtitle,
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.pageTitle.copyWith(
                                          color: AppColors.paperWhite,
                                          fontSize: 34,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        'افتتاحية هادئة بطابع نشرات الأخبار الكلاسيكية مع انتقال أنيق إلى لوحة التحكم الرئيسية.',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.body.copyWith(
                                          color: AppColors.softGray,
                                          height: 1.7,
                                        ),
                                      ),
                                      const SizedBox(height: 28),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 18,
                                          vertical: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            999,
                                          ),
                                          color: AppColors.broadcastRed
                                              .withValues(alpha: 0.18),
                                          border: Border.all(
                                            color: AppColors.broadcastRed
                                                .withValues(alpha: 0.35),
                                          ),
                                        ),
                                        child: Text(
                                          'تهيئة الاستوديو والبث الجاري',
                                          style: AppTextStyles.caption.copyWith(
                                            color: AppColors.paperWhite,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: LinearProgressIndicator(
                          minHeight: 4,
                          backgroundColor: AppColors.paperWhite.withValues(
                            alpha: 0.12,
                          ),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.broadcastRed,
                          ),
                        ),
                      ),
                    ],
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
