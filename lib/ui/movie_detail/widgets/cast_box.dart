import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CastBox extends StatelessWidget {
  const CastBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: AppColors.lightGrey.withAlpha(25),
      ),
      child: ExpansionTile(
        dense: true,
        tilePadding: const EdgeInsets.only(left: 0, right: 0),
        childrenPadding: const EdgeInsets.symmetric(vertical: 10),
        title: const Text('Elenco'),
      ),
    );
  }
}
