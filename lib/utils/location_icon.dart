import 'package:flutter/material.dart';
import 'package:weather_whenever/utils/app_colors.dart';

class LocationIcon extends StatelessWidget {
  final VoidCallback onTap;
  const LocationIcon({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.location_on_sharp,
          color: AppColors.black,
          size: 34,
        ));
  }
}
