import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/modules/outro/controllers/outro_controller.dart';
import 'package:newscope/shared/widgets/custom_section_title.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class OutroView extends GetView<OutroController> {
  const OutroView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProgramShell(
      title: 'Programme Outro',
      subtitle: 'Closing panel and sign-off for the evening bulletin.',
      tickerItems: controller.tickerItems,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppColors.paperWhite,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.softGray),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Closing Remarks', style: AppTextStyles.pageTitle),
                const SizedBox(height: 16),
                Text(
                  'The programme signs off with a calm review of the lead bulletin, a look toward tomorrow\'s planning board, and a direct route back to the home dashboard.',
                  style: AppTextStyles.body,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: controller.backToDashboard,
                  child: const Text('Return To Dashboard'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const CustomSectionTitle(
            title: 'Closing Notes',
            subtitle:
                'Short editorial reminders for the final minute of the show.',
          ),
          const SizedBox(height: 16),
          for (final note in controller.closingNotes) ...[
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
