import 'package:flutter/material.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class CustomTicker extends StatelessWidget {
  const CustomTicker({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.midnightBlue,
        border: Border(
          top: BorderSide(color: AppColors.broadcastRed, width: 3),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16, right: 14),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.broadcastRed,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'LIVE DESK',
              style: AppTextStyles.meta.copyWith(color: AppColors.paperWhite),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final item in items) ...[
                    Text(
                      item,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.paperWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: AppColors.broadcastRed,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
