import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final scaleMatrix = Matrix4.identity()
..scale(1.5)
..translate(-100.0, -130.0);

TransformationController _transformationController =
    TransformationController(scaleMatrix);

class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: InteractiveViewer(
        transformationController: _transformationController,
        maxScale: 10.0,
        child: SvgPicture.asset(
          'assets/images/blue_map.svg',
          semanticsLabel: 'Map',
          colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.exclusion),
          ),
      ),
    );
  }
}
