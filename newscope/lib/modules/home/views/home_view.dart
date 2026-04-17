import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_background.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
import 'package:newscope/app/widgets/custom_3d_nav_tile.dart';
import 'package:newscope/app/widgets/custom_3d_quote_box.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
import 'package:newscope/app/widgets/custom_3d_section_header.dart';
import 'package:newscope/app/widgets/custom_3d_stat_box.dart';
import 'package:newscope/app/widgets/custom_3d_ticker.dart';
import 'package:newscope/modules/home/controllers/home_controller.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Custom3dBackground(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Custom3dReveal(child: _buildHero(context)),
                        const SizedBox(height: 22),
                        Custom3dReveal(
                          delay: const Duration(milliseconds: 80),
                          child: Custom3dSectionHeader(
                            eyebrow: 'غرفة التحكم',
                            title: 'لوحة النشرة ثلاثية الأبعاد',
                            subtitle:
                                'تنقل مباشر بين الفقرات بصياغة بصرية تحاكي غرفة أخبار حديثة مع الحفاظ على الهوية الرسمية.',
                            trailing: Custom3dBadge(
                              label: 'جاهز للبث',
                              icon: Icons.sensors,
                              backgroundColor: AppColors.broadcastRed
                                  .withValues(alpha: 0.18),
                              foregroundColor: AppColors.broadcastRed,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final width = constraints.maxWidth;
                            final columns = width >= 1280
                                ? 4
                                : width >= 900
                                ? 3
                                : width >= 620
                                ? 2
                                : 1;
                            final cardWidth = columns == 1
                                ? width
                                : (width - ((columns - 1) * 16)) / columns;

                            return Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              children: [
                                for (
                                  var index = 0;
                                  index < controller.destinations.length;
                                  index++
                                )
                                  SizedBox(
                                    width: cardWidth,
                                    height: 248,
                                    child: Custom3dReveal(
                                      delay: Duration(
                                        milliseconds: 120 + (index * 30),
                                      ),
                                      child: Custom3dNavTile(
                                        title: controller
                                            .destinations[index]
                                            .title,
                                        subtitle: controller
                                            .destinations[index]
                                            .summary,
                                        schedule: controller
                                            .destinations[index]
                                            .scheduleLabel,
                                        icon:
                                            controller.destinations[index].icon,
                                        onTap: () => controller.openRoute(
                                          controller.destinations[index].route,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        Custom3dReveal(
                          delay: const Duration(milliseconds: 180),
                          child: Custom3dSectionHeader(
                            eyebrow: 'مؤشرات التشغيل',
                            title: 'قراءات سريعة من مركز البث',
                            subtitle:
                                'مؤشرات عددية سريعة تمنح صورة فورية عن جاهزية مسارات البرنامج.',
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            for (
                              var index = 0;
                              index < controller.metrics.length;
                              index++
                            )
                              Custom3dReveal(
                                delay: Duration(
                                  milliseconds: 200 + (index * 40),
                                ),
                                child: Custom3dStatBox(
                                  label: controller.metrics[index].label,
                                  value: controller.metrics[index].value,
                                  caption: controller.metrics[index].caption,
                                  tone: index.isEven
                                      ? App3dTone.surface
                                      : App3dTone.dark,
                                  icon: index == 0
                                      ? Icons.view_module_outlined
                                      : index == 1
                                      ? Icons.campaign_outlined
                                      : Icons.wb_cloudy_outlined,
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Custom3dReveal(
                          delay: const Duration(milliseconds: 260),
                          child: Custom3dQuoteBox(
                            quote: controller.editorialQuote.quote,
                            speaker: controller.editorialQuote.speaker,
                            role: controller.editorialQuote.role,
                            tone: App3dTone.glass,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Custom3dTicker(items: controller.tickerItems),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: App3dStyles.panelDecoration(
        tone: App3dTone.glass,
        radius: 30,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 980;

          final copy = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  const Custom3dBadge(
                    label: 'غرفة أخبار هولوغرافية',
                    icon: Icons.control_camera_outlined,
                    backgroundColor: Color(0x22FFFFFF),
                    foregroundColor: AppColors.paperWhite,
                  ),
                  for (final item in controller.statusItems)
                    Custom3dBadge(
                      label: item,
                      backgroundColor: Colors.white.withValues(alpha: 0.08),
                      foregroundColor: AppColors.paperWhite,
                    ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                'لوحة تحكم النشرة الرئيسية',
                style: AppTextStyles.masthead.copyWith(
                  fontSize: 34,
                  color: AppColors.paperWhite,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'تصميم متعدد الطبقات يضع كل فقرة في موقعها داخل مشهد يشبه استوديو البث والتحكم المباشر، مع عمق بصري هادئ ولمسات ضوء مدروسة.',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.softGray,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                controller.editorialQuote.quote,
                style: AppTextStyles.bodyStrong.copyWith(
                  color: AppColors.paperWhite,
                  height: 1.8,
                ),
              ),
            ],
          );

          final visual = Container(
            constraints: const BoxConstraints(minHeight: 280),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: const LinearGradient(
                colors: [
                  Color(0x2200B8FF),
                  Color(0x12FFFFFF),
                  Color(0x20C62828),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.white.withValues(alpha: 0.03),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                for (final top in [48.0, 96.0, 144.0, 192.0, 240.0])
                  Positioned(
                    top: top,
                    left: 20,
                    right: 20,
                    child: Container(
                      height: 1,
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                for (final alignment in const [
                  Alignment.topLeft,
                  Alignment.center,
                  Alignment.bottomRight,
                  Alignment.centerRight,
                ])
                  Align(
                    alignment: alignment,
                    child: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.broadcastRed,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.broadcastRed.withValues(
                                alpha: 0.5,
                              ),
                              blurRadius: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Center(
                  child: Transform(
                    alignment: Alignment.center,
                    transform: App3dStyles.tiltedMatrix(
                      rotateX: 0.08,
                      rotateY: -0.10,
                    ),
                    child: Container(
                      width: 240,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF12335A), Color(0xFF08172C)],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.30),
                            blurRadius: 28,
                            offset: const Offset(0, 24),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.settings_input_antenna_rounded,
                            color: AppColors.paperWhite,
                            size: 42,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'NewsScope',
                            style: AppTextStyles.headline.copyWith(
                              color: AppColors.paperWhite,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Control Room',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.softGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

          if (!isWide) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [copy, const SizedBox(height: 20), visual],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 6, child: copy),
              const SizedBox(width: 20),
              Expanded(flex: 5, child: visual),
            ],
          );
        },
      ),
    );
  }
}
