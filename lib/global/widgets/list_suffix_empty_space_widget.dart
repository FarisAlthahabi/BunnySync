import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListSuffixEmptySpaceWidget extends StatelessWidget {
  const ListSuffixEmptySpaceWidget({
    super.key,
    required this.length,
  });

  final int length;

  @override
  Widget build(BuildContext context) {
    // Calculate height based on length
    final height = (length <= 0) ? 0.2.sh : (0.2.sh / (length * 0.1));

    return SizedBox(height: height);
  }
}
