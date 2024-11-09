import 'package:flutter/material.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:fruitmarket/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:fruitmarket/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                    backgroundColor: TColors.textWhite.withOpacity(.1))),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withOpacity(.1)),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
