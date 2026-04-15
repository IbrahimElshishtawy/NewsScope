import 'package:flutter/material.dart';
import 'package:newscope/core/responsive/responsive_layout.dart';
import 'package:newscope/shared/widgets/custom_app_bar.dart';
import 'package:newscope/shared/widgets/custom_ticker.dart';

class ProgramShell extends StatelessWidget {
  const ProgramShell({
    super.key,
    required this.title,
    required this.body,
    required this.tickerItems,
    this.subtitle,
    this.showHomeAction = true,
    this.showBackAction = true,
  });

  final String title;
  final String? subtitle;
  final Widget body;
  final List<String> tickerItems;
  final bool showHomeAction;
  final bool showBackAction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
        subtitle: subtitle,
        showHomeAction: showHomeAction,
        showBackAction: showBackAction,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: ResponsiveLayout.maxContentWidth(context),
                  ),
                  child: Padding(
                    padding: ResponsiveLayout.pagePadding(context),
                    child: body,
                  ),
                ),
              ),
            ),
          ),
          CustomTicker(items: tickerItems),
        ],
      ),
    );
  }
}
