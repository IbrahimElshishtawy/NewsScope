import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/theme/app_depth_tokens.dart';
import 'package:newscope/app/widgets/custom_3d_badge.dart';
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

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        child: Container(
          decoration: App3dStyles.panelDecoration(
            tone: App3dTone.glass,
            radius: AppDepthTokens.radiusLg,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Custom3dBadge(
                        label: 'NEWSSCOPE',
                        icon: Icons.sensors,
                        backgroundColor: Color(0x22FFFFFF),
                        foregroundColor: AppColors.paperWhite,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        style: AppTextStyles.sectionTitle.copyWith(
                          color: AppColors.paperWhite,
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          subtitle!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.softGray,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (showBackAction && canPop)
                  _AppBarButton(
                    tooltip: 'Back',
                    icon: Icons.arrow_back_outlined,
                    onPressed: Get.back,
                  ),
                if (showHomeAction)
                  _AppBarButton(
                    tooltip: 'Dashboard',
                    icon: Icons.dashboard_outlined,
                    onPressed: () => Get.offAllNamed(AppRoutes.home),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(94);
}

class _AppBarButton extends StatelessWidget {
  const _AppBarButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(16),
          child: Tooltip(
            message: tooltip,
            child: Ink(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white.withValues(alpha: 0.08),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Icon(icon, color: AppColors.paperWhite),
            ),
          ),
        ),
      ),
    );
  }
}
