import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/headlines/controllers/headlines_controller.dart';
import 'package:newscope/modules/headlines/widgets/headline_item_tile.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class HeadlinesView extends GetView<HeadlinesController> {
  const HeadlinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF09182B),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: const LinearGradient(
                      colors: [AppColors.broadcastRed, AppColors.midnightBlue],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.bannerTitle,
                              style: AppTextStyles.masthead.copyWith(
                                color: AppColors.paperWhite,
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'موجز رسمي سريع للعناوين الأهم قبل الدخول في تفاصيل النشرة.',
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
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth >= 900;
                    final anchorPanel = Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10243D),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: AppColors.paperWhite.withValues(alpha: 0.08),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.paperWhite.withValues(
                                    alpha: 0.08,
                                  ),
                                  border: Border.all(
                                    color: AppColors.broadcastRed.withValues(
                                      alpha: 0.32,
                                    ),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.mic_rounded,
                                  color: AppColors.paperWhite,
                                  size: 34,
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
                                        fontSize: 22,
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
                          Text(
                            'الافتتاحية',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.broadcastRed,
                              letterSpacing: 1.4,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            controller.section.quote.quote,
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.paperWhite,
                              height: 1.7,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: AppColors.paperWhite.withValues(
                                alpha: 0.06,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: controller.section.agenda
                                  .map(
                                    (item) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              style: AppTextStyles.caption
                                                  .copyWith(
                                                    color: AppColors.paperWhite,
                                                    height: 1.6,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    );

                    final headlinesPanel = Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: AppColors.paperWhite,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Top Stories',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.broadcastRed,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            controller.section.strapline,
                            style: AppTextStyles.pageTitle.copyWith(
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Expanded(
                            child: ListView.separated(
                              itemCount: controller.stories.length,
                              separatorBuilder: (_, _) =>
                                  const SizedBox(height: 14),
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

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                      child: isWide
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
                            ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                color: AppColors.broadcastRed,
                child: Text(
                  controller.tickerItems.join('  •  '),
                  style: AppTextStyles.ticker,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
