import 'package:e_commerce_app/utils/common/widgets/clippers/curved_edges_clipper.dart';
import 'package:flutter/material.dart';

class CurvedEdgesClipperWidget extends StatelessWidget {
  const CurvedEdgesClipperWidget({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CurvedEdgesClipper(), child: child);
  }
}
