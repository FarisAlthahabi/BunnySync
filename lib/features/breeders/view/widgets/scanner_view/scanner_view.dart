import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bunny_sync/features/breeders/view/widgets/scanner_view/widgets/analyze_image_from_gallery_button.dart';
import 'package:bunny_sync/features/breeders/view/widgets/scanner_view/widgets/scanner_error_widget.dart';
import 'package:bunny_sync/features/breeders/view/widgets/scanner_view/widgets/start_stop_scanner_Button.dart';
import 'package:bunny_sync/features/breeders/view/widgets/scanner_view/widgets/switch_camera_button.dart';
import 'package:bunny_sync/features/breeders/view/widgets/scanner_view/widgets/toggle_flashlight_button.dart';
import 'package:bunny_sync/global/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

@RoutePage()
class BarcodeScannerView extends StatefulWidget {
  const BarcodeScannerView({super.key});

  @override
  State<BarcodeScannerView> createState() =>
      _BarcodeScannerViewState();
}

class _BarcodeScannerViewState
    extends State<BarcodeScannerView> with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    autoStart: false,
    torchEnabled: true,
    useNewCameraSelector: true,
  );

  Barcode? _barcode;
  StreamSubscription<Object?>? _subscription;

  Widget _buildBarcode(Barcode? value) {
    if (value == null) {
      return Text(
        'scan_something'.i18n,
        overflow: TextOverflow.fade,
        style: const TextStyle(color: Colors.white),
      );
    }

    return Text(
      value.displayValue ?? 'no_display_value.'.i18n,
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  void _handleBarcode(BarcodeCapture barcodes) {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _subscription = controller.barcodes.listen(_handleBarcode);

    unawaited(controller.start());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!controller.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        _subscription = controller.barcodes.listen(_handleBarcode);

        unawaited(controller.start());
      case AppLifecycleState.inactive:
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(controller.stop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('scan_qr_code'.i18n)),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            errorBuilder: (context, error, child) {
              return ScannerErrorWidget(error: error);
            },
            fit: BoxFit.contain,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 100,
              color: Colors.black.withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleFlashlightButton(controller: controller),
                  StartStopMobileScannerButton(controller: controller),
                  Expanded(child: Center(child: _buildBarcode(_barcode))),
                  SwitchCameraButton(controller: controller),
                  AnalyzeImageFromGalleryButton(controller: controller),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    super.dispose();
    await controller.dispose();
  }
}
