import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_background.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
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
        backgroundColor: Colors.transparent,
        body: Custom3dBackground(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
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
                              constraints: const BoxConstraints(maxWidth: 760),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(28),
                                decoration: App3dStyles.panelDecoration(
                                  tone: App3dTone.glass,
                                  radius: 34,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Custom3dBadge(
                                      label: 'افتتاحية ثلاثية الأبعاد',
                                      icon: Icons.sensors,
                                      backgroundColor: Color(0x22FFFFFF),
                                      foregroundColor: AppColors.paperWhite,
                                    ),
                                    const SizedBox(height: 24),
                                    _buildLogoBlock(),
                                    const SizedBox(height: 26),
                                    Text(
                                      controller.channelName,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.masthead.copyWith(
                                        fontSize: 40,
                                        color: AppColors.paperWhite,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      controller.stationLabel,
                                      style: AppTextStyles.caption.copyWith(
                                        color: AppColors.softGray,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      controller.subtitle,
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.pageTitle.copyWith(
                                        fontSize: 34,
                                        color: AppColors.paperWhite,
                                      ),
                                    ),
                                    const SizedBox(height: 14),
                                    Text(
                                      'مشهد افتتاحي سينمائي بعمق ضوئي، طبقات شفافة، وإحساس استوديو أخبار متطور يمهد للانتقال إلى غرفة التحكم الرئيسية.',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.body.copyWith(
                                        color: AppColors.softGray,
                                        height: 1.8,
                                      ),
                                    ),
                                    const SizedBox(height: 26),
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
                                            .withValues(alpha: 0.14),
                                        border: Border.all(
                                          color: AppColors.broadcastRed
                                              .withValues(alpha: 0.32),
                                        ),
                                      ),
                                      child: Text(
                                        'تهيئة قاعة البث والمشهد الافتتاحي',
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
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(999),
                    child: LinearProgressIndicator(
                      minHeight: 5,
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
        ),
      ),
    );
  }

  Widget _buildLogoBlock() {
    return SizedBox(
      width: 240,
      height: 240,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
            ),
          ),
          Container(
            width: 172,
            height: 172,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(42),
              gradient: const LinearGradient(
                colors: [
                  Color(0x331F9FFF),
                  Color(0x14FFFFFF),
                  Color(0x33C62828),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              border: Border.all(color: Colors.white.withValues(alpha: 0.14)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.broadcastRed.withValues(alpha: 0.20),
                  blurRadius: 42,
                ),
              ],
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: App3dStyles.tiltedMatrix(rotateX: 0.08, rotateY: -0.12),
            child: Container(
              width: 132,
              height: 132,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF143861), Color(0xFF08172C)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                border: Border.all(color: Colors.white.withValues(alpha: 0.16)),
              ),
              child: Center(
                child: Text(
                  'NS',
                  style: AppTextStyles.masthead.copyWith(
                    fontSize: 44,
                    color: AppColors.paperWhite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
