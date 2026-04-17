import 'package:flutter/material.dart';
import 'package:newscope/app/widgets/custom_3d_background.dart';
import 'package:newscope/app/widgets/custom_3d_reveal.dart';
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          title: title,
          subtitle: subtitle,
          showHomeAction: showHomeAction,
          showBackAction: showBackAction,
        ),
        body: Custom3dBackground(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top:
                        CustomAppBar(
                          title: title,
                          subtitle: subtitle,
                        ).preferredSize.height +
                        12,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: ResponsiveLayout.maxContentWidth(context),
                      ),
                      child: Padding(
                        padding: ResponsiveLayout.pagePadding(context),
                        child: Custom3dReveal(child: body),
                      ),
                    ),
                  ),
                ),
              ),
              CustomTicker(items: tickerItems),
            ],
          ),
        ),
      ),
    );
  }
}
