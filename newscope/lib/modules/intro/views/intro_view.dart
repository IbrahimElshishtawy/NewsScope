import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/intro/controllers/intro_controller.dart';
import 'package:newscope/shared/widgets/custom_section_title.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProgramShell(
      title: 'Programme Intro',
      subtitle:
          'Opening titles and editorial framing for the evening bulletin.',
      tickerItems: controller.tickerItems,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.studioBlue, AppColors.midnightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tonight\'s programme opens with disciplined headlines, deep reporting, and a formal classic visual tone.',
                  style: AppTextStyles.pageTitle.copyWith(
                    color: AppColors.paperWhite,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'This intro screen acts as the editorial handoff from the splash sequence into the full dashboard, presenting the tone, pacing, and structure of the show.',
                  style: AppTextStyles.body.copyWith(color: AppColors.softGray),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: controller.openDashboard,
                  child: const Text('Enter Dashboard'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const CustomSectionTitle(
            title: 'Opening Notes',
            subtitle:
                'Editorial cues used to brief the control room before going on air.',
          ),
          const SizedBox(height: 16),
          for (final note in controller.openingNotes) ...[
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 14),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.paperWhite,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.softGray),
              ),
              child: Text(note, style: AppTextStyles.bodyStrong),
            ),
          ],
        ],
      ),
    );
  }
}
