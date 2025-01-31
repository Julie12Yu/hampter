import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ViewHampter extends StatelessWidget {
  const ViewHampter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // Specify a fixed height
      width: 300, // Optional: Match the parent's width
      child: const ModelViewer(
        src: 'assets/moo_deng.glb',
        iosSrc: 'assets/moo_deng.usdz',
        alt: 'moo deng :D',
        ar: false, // Disable AR
        autoRotate: true,
        cameraControls: true,
        disableZoom: true,
        loading: Loading.lazy,
      ),
    );
  }
}
