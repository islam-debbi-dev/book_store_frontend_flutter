import 'package:flutter/material.dart';

import '../../feattures/admin/adminhome/data/models/author.dart';
import 'cards/compact_card.dart';
import 'cards/detailed_card.dart';
import 'cards/minimal_card.dart';
import 'cards/standard_card.dart';

// Modern Author Card Widget
class AuthorCard extends StatefulWidget {
  final Author author;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final bool showNationality;
  final bool showCreatedDate;
  final CardStyle cardStyle;

  const AuthorCard({
    super.key,
    required this.author,
    this.onTap,
    this.width,
    this.height,
    this.showNationality = true,
    this.showCreatedDate = false,
    this.cardStyle = CardStyle.standard,
  });

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  // Helper methods
  String get fullName {
    final first = widget.author.firstName ?? '';
    final last = widget.author.lastName ?? '';
    return '$first $last'.trim();
  }

  String get initials {
    final first = widget.author.firstName?.isNotEmpty == true
        ? widget.author.firstName![0]
        : '';
    final last = widget.author.lastName?.isNotEmpty == true
        ? widget.author.lastName![0]
        : '';
    return '$first$last'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.cardStyle) {
      case CardStyle.compact:
        return CompactCard(
          context,
          widget.onTap,
          fullName,
          widget.author,
          widget.showNationality,
          width: widget.width ?? 260,
          height: widget.height ?? 100,
        );
      case CardStyle.detailed:
        return DetailedCard(
          context,
          widget.onTap,
          fullName,
          widget.author,
          widget.showNationality,
          widget.showCreatedDate,
          width: widget.width ?? 320,
          height: widget.height ?? 320,
        );
      case CardStyle.minimal:
        return MinimalCard(
          context,
          widget.onTap,
          fullName,
          widget.author,
          widget.showNationality,
          width: widget.width ?? 120,
          height: widget.height ?? 120,
        );
      default:
        return StandardCard(context, widget.onTap, fullName, widget.author,
            widget.showNationality);
    }
  }
}

enum CardStyle {
  standard,
  compact,
  detailed,
  minimal,
}
