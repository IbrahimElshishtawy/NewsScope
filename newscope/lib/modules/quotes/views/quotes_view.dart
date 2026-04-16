import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/data/models/quote_model.dart';
import 'package:newscope/modules/quotes/controllers/quotes_controller.dart';
import 'package:newscope/shared/widgets/program_shell.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class QuotesView extends GetView<QuotesController> {
  const QuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final quotes = controller.quotes;
    final official = quotes.first;
    final secondaryQuotes = quotes.skip(1).toList(growable: false);

    return ProgramShell(
      title: 'الاقتباسات',
      subtitle: 'عرض رسمي للتصريحات المحورية مع المصدر والتوقيت والسياق.',
      tickerItems: controller.tickerItems,
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
                            child: _buildOfficialPortrait(official),
                          ),
                          const SizedBox(width: 22),
                          Expanded(
                            flex: 7,
                            child: _buildQuotePanel(official),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildOfficialPortrait(official),
                          const SizedBox(height: 20),
                          _buildQuotePanel(official),
                        ],
                      ),
              ),
              const SizedBox(height: 24),
              Text('تصريحات إضافية', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 14),
              Wrap(
                spacing: 18,
                runSpacing: 18,
                children: secondaryQuotes
                    .map((quote) => _buildQuoteContextCard(quote))
                    .toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOfficialPortrait(QuoteModel quote) {
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
          Text('صورة المتحدث: ${quote.imageUrl}', style: AppTextStyles.caption),
          const SizedBox(height: 10),
          Text(quote.speakerName, style: AppTextStyles.sectionTitle),
          const SizedBox(height: 6),
          Text(quote.role, style: AppTextStyles.body),
          const SizedBox(height: 6),
          Text(quote.topic, style: AppTextStyles.caption),
        ],
      ),
    );
  }

  Widget _buildQuotePanel(QuoteModel quote) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'التصريح الرئيسي',
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
                '"${quote.quoteText}"',
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
        Text(quote.speakerName, style: AppTextStyles.headline),
        const SizedBox(height: 6),
        Text(quote.role, style: AppTextStyles.body),
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
              Text('المصدر', style: AppTextStyles.bodyStrong),
              const SizedBox(height: 8),
              Text(
                '${quote.source} | ${quote.publishTime}',
                style: AppTextStyles.body,
              ),
              const SizedBox(height: 8),
              Text('الموضوع: ${quote.topic}', style: AppTextStyles.caption),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildQuoteContextCard(QuoteModel quote) {
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
          quote.topic,
          style: AppTextStyles.caption.copyWith(color: AppColors.broadcastRed),
        ),
        const SizedBox(height: 8),
        Text(quote.speakerName, style: AppTextStyles.bodyStrong),
        const SizedBox(height: 6),
        Text(quote.role, style: AppTextStyles.caption),
        const SizedBox(height: 10),
        Text(quote.quoteText, style: AppTextStyles.body),
        const SizedBox(height: 10),
        Text(
          '${quote.source} | ${quote.publishTime}',
          style: AppTextStyles.caption.copyWith(color: AppColors.steelGray),
        ),
      ],
    ),
  );
}
