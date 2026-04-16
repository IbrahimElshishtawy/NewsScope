import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/routes/app_routes.dart';
import 'package:newscope/themes/app_colors.dart';
import 'package:newscope/themes/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.showHomeAction = true,
    this.showBackAction = true,
  });

  final String title;
  final String? subtitle;
  final bool showHomeAction;
  final bool showBackAction;

  @override
  Widget build(BuildContext context) {
    final canPop = Get.key.currentState?.canPop() ?? false;

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 88,
      titleSpacing: 20,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'NEWSSCOPE',
            style: AppTextStyles.caption.copyWith(color: AppColors.softGray),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppTextStyles.sectionTitle.copyWith(
              color: AppColors.paperWhite,
            ),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.softGray,
                fontSize: 14,
              ),
            ),
        ],
      ),
      actions: [
        if (showBackAction && canPop)
          IconButton(
            tooltip: 'Back',
            onPressed: Get.back,
            icon: const Icon(Icons.arrow_back_outlined),
          ),
        if (showHomeAction)
          IconButton(
            tooltip: 'Dashboard',
            onPressed: () => Get.offAllNamed(AppRoutes.home),
            icon: const Icon(Icons.dashboard_outlined),
          ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(6),
        child: Container(height: 6, color: AppColors.broadcastRed),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(94);
}
