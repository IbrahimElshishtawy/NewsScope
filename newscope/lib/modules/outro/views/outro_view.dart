import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF06111F),
                AppColors.midnightBlue,
                Color(0xFF102E4C),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -90,
                left: -70,
                child: Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.paperWhite.withValues(alpha: 0.05),
                  ),
                ),
              ),
              Positioned(
                bottom: -80,
                right: -40,
                child: Container(
                  width: 240,
                  height: 240,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.broadcastRed.withValues(alpha: 0.14),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      Center(
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 560),
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: AppColors.paperWhite.withValues(alpha: 0.07),
                            border: Border.all(
                              color: AppColors.paperWhite.withValues(
                                alpha: 0.10,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 112,
                                height: 112,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.paperWhite.withValues(
                                    alpha: 0.08,
                                  ),
                                  border: Border.all(
                                    color: AppColors.paperWhite.withValues(
                                      alpha: 0.18,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'NS',
                                    style: AppTextStyles.masthead.copyWith(
                                      color: AppColors.paperWhite,
                                      fontSize: 34,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'شكراً لمتابعتكم',
                                style: AppTextStyles.masthead.copyWith(
                                  color: AppColors.paperWhite,
                                  fontSize: 34,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'كان معكم فريق نشرة المساء. نلقاكم في موجزٍ قادم بطابع مهني هادئ ورسالة إخبارية واضحة.',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.softGray,
                                ),
                              ),
                              const SizedBox(height: 22),
                              ...controller.closingNotes.map(
                                (note) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text(
                                    note,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.caption.copyWith(
                                      color: AppColors.paperWhite,
                                      height: 1.7,
                                    ),
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
                      const Spacer(),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.broadcastRed,
                        ),
                        child: Text(
                          controller.tickerItems.join('  •  '),
                          style: AppTextStyles.ticker,
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
