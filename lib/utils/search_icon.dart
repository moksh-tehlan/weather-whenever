import 'package:flutter/material.dart';
import 'package:weather_whenever/utils/app_colors.dart';

class SearchIcon extends StatelessWidget {
  final VoidCallback onTap;
  const SearchIcon({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.search_rounded,
          color: AppColors.black,
          size: 34,
        ));
  }
}
