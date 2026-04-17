import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_background.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_ticker.dart';
import 'package:newscope/modules/outro/controllers/outro_controller.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class OutroView extends GetView<OutroController> {
  const OutroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Custom3dBackground(
          showCenterBeam: false,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Spacer(),
                  Custom3dReveal(
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 720),
                        padding: const EdgeInsets.all(30),
                        decoration: App3dStyles.panelDecoration(
                          tone: App3dTone.glass,
                          radius: 34,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Custom3dBadge(
                              label: 'خاتمة البث',
                              icon: Icons.nightlight_round,
                              backgroundColor: Color(0x22FFFFFF),
                              foregroundColor: AppColors.paperWhite,
                            ),
                            const SizedBox(height: 22),
                            Container(
                              width: 128,
                              height: 128,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF143861),
                                    Color(0xFF08172C),
                                  ],
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                ),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.16),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.broadcastRed
                                        .withValues(alpha: 0.18),
                                    blurRadius: 36,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'NS',
                                  style: AppTextStyles.masthead.copyWith(
                                    color: AppColors.paperWhite,
                                    fontSize: 38,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'شكراً لمتابعتكم',
                              style: AppTextStyles.masthead.copyWith(
                                color: AppColors.paperWhite,
                                fontSize: 38,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'ختام هادئ بطابع استوديو فاخر، يترك المشاهد مع إحساس الثقة والرزانة واستمرارية الهوية الإخبارية.',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.softGray,
                                height: 1.8,
                              ),
                            ),
                            const SizedBox(height: 18),
                            for (final note in controller.closingNotes)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  note,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.paperWhite,
                                    height: 1.8,
                                  ),
                                ),
                              ),
                            const SizedBox(height: 18),
                            ElevatedButton.icon(
                              onPressed: controller.backToDashboard,
                              icon: const Icon(Icons.home_outlined),
                              label: const Text('العودة إلى الرئيسية'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Custom3dTicker(items: controller.tickerItems),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
