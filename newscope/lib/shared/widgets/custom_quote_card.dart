import 'package:flutter/material.dart';
import 'package:newscope/data/models/program_quote.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class CustomQuoteCard extends StatelessWidget {
  const CustomQuoteCard({
    super.key,
    required this.quote,
    this.label = 'Anchor Quote',
  });

  final ProgramQuote quote;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.paperWhite,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderGray),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.format_quote_outlined,
                color: AppColors.broadcastRed,
              ),
              const SizedBox(width: 10),
              Text(
                label.toUpperCase(),
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.broadcastRed,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '"${quote.quote}"',
            style: AppTextStyles.bodyStrong.copyWith(fontSize: 18, height: 1.7),
          ),
          const SizedBox(height: 16),
          Text(
            quote.speaker,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.midnightBlue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            quote.role,
            style: AppTextStyles.body.copyWith(
              fontSize: 15,
              color: AppColors.steelGray,
            ),
          ),
        ],
      ),
    );
  }
}
