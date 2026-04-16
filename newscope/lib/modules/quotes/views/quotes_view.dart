import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/data/models/program_story.dart';
import 'package:newscope/modules/quotes/controllers/quotes_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class QuotesView extends GetView<QuotesController> {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final section = controller.section;
    final official = section.quote;
    final sourceStory = section.leadStory;

    return ProgramShell(
      title: 'Official Statements',
      subtitle: 'Formal quote treatment with source and speaker context',
      tickerItems: section.tickerItems,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 900;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.paperWhite,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: AppColors.borderGray),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 24,
                      offset: Offset(0, 14),
                    ),
                  ],
                ),
                child: isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: _buildOfficialPortrait(
                              speaker: official.speaker,
                              role: official.role,
                            ),
                          ),
                          const SizedBox(width: 22),
                          Expanded(
                            flex: 7,
                            child: _buildQuotePanel(
                              quote: official.quote,
                              speaker: official.speaker,
                              role: official.role,
                              sourceStory: sourceStory,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildOfficialPortrait(
                            speaker: official.speaker,
                            role: official.role,
                          ),
                          const SizedBox(height: 20),
                          _buildQuotePanel(
                            quote: official.quote,
                            speaker: official.speaker,
                            role: official.role,
                            sourceStory: sourceStory,
                          ),
                        ],
                      ),
              ),
              const SizedBox(height: 24),
              Text('Context', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 14),
              Wrap(
                spacing: 18,
                runSpacing: 18,
                children: section.sideStories
                    .map((story) => _buildContextCard(story))
                    .toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOfficialPortrait({
    required String speaker,
    required String role,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.ivory,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 4 / 5,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFD8DEE8), Color(0xFFF4F6F9)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Center(
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 96,
                  color: AppColors.steelGray,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Official portrait placeholder', style: AppTextStyles.caption),
          const SizedBox(height: 10),
          Text(speaker, style: AppTextStyles.sectionTitle),
          const SizedBox(height: 6),
          Text(role, style: AppTextStyles.body),
        ],
      ),
    );
  }

  Widget _buildQuotePanel({
    required String quote,
    required String speaker,
    required String role,
    required ProgramStory sourceStory,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quoted statement',
          style: AppTextStyles.caption.copyWith(color: AppColors.broadcastRed),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.midnightBlue,
            borderRadius: BorderRadius.circular(26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.format_quote_rounded,
                color: AppColors.broadcastRed,
                size: 42,
              ),
              const SizedBox(height: 14),
              Text(
                '"$quote"',
                style: AppTextStyles.pageTitle.copyWith(
                  color: AppColors.paperWhite,
                  fontSize: 32,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Text(speaker, style: AppTextStyles.headline),
        const SizedBox(height: 6),
        Text(role, style: AppTextStyles.body),
        const SizedBox(height: 18),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.ivory,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.borderGray),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Source', style: AppTextStyles.bodyStrong),
              const SizedBox(height: 8),
              Text(
                '${sourceStory.category} desk | ${sourceStory.location} | ${sourceStory.timeLabel}',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 8),
              Text(sourceStory.title, style: AppTextStyles.caption),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildContextCard(ProgramStory story) {
  return Container(
    constraints: const BoxConstraints(minWidth: 280, maxWidth: 400),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: AppColors.paperWhite,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: AppColors.borderGray),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          story.focus.toUpperCase(),
          style: AppTextStyles.caption.copyWith(color: AppColors.broadcastRed),
        ),
        const SizedBox(height: 8),
        Text(story.title, style: AppTextStyles.bodyStrong),
        const SizedBox(height: 10),
        Text(story.summary, style: AppTextStyles.body),
      ],
    ),
  );
}
