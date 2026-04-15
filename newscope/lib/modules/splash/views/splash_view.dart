import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/splash/controllers/splash_controller.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.midnightBlue,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.broadcastRed, width: 2),
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.paperWhite.withValues(alpha: 0.06),
                  ),
                  child: const Icon(
                    Icons.newspaper_outlined,
                    size: 84,
                    color: AppColors.paperWhite,
                  ),
                ),
                const SizedBox(height: 28),
                Text('NewsScope', style: AppTextStyles.masthead),
                const SizedBox(height: 12),
                Text(
                  'Classic bulletin presentation built with Flutter and GetX.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body.copyWith(color: AppColors.softGray),
                ),
                const SizedBox(height: 28),
                Obx(
                  () => Text(
                    'Starting in ${controller.countdown.value}',
                    style: AppTextStyles.meta.copyWith(
                      color: AppColors.paperWhite,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
