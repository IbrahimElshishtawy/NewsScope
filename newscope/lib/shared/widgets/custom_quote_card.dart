import 'package:flutter/material.dart';
import 'package:newscope/app/theme/app_3d_styles.dart';
import 'package:newscope/app/widgets/custom_3d_quote_box.dart';
import 'package:newscope/data/models/program_quote.dart';

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
    return Custom3dQuoteBox(
      quote: quote.quote,
      speaker: quote.speaker,
      role: '$label | ${quote.role}',
      tone: App3dTone.surface,
    );
  }
}
