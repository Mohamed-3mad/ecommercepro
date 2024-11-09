import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      // create custom shape
      clipper: TCustomCurvedEdges(),
      child: child,
    );
  }
}
