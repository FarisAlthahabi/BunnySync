import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:webview_flutter/webview_flutter.dart';

abstract class PedigreeTabCallbacks {
  void onTryAgainTap();
}

class PedigreeTab extends StatefulWidget {
  const PedigreeTab({
    super.key,
    required this.breederId,
    this.controller,
  });

  final int breederId;
  final ScrollController? controller;

  @override
  State<PedigreeTab> createState() => _PedigreeTabState();
}

class _PedigreeTabState extends State<PedigreeTab>
    implements PedigreeTabCallbacks {
  late final BreederDetailsCubit breederDetailsCubit = context.read();

  @override
  void initState() {
    breederDetailsCubit.getBreederPedigree(widget.breederId);
    super.initState();
  }

  @override
  void onTryAgainTap() {
    breederDetailsCubit.getBreederPedigree(widget.breederId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreederDetailsCubit, GeneralBreederDetailsState>(
      buildWhen: (prev, curr) => curr is BreederPedigreeState,
      builder: (context, state) {
        if (state is BreederPedigreeFetch) {
          return WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setBackgroundColor(const Color(0x00000000))
              ..setNavigationDelegate(
                NavigationDelegate(
                  onProgress: (int progress) {
                    context.loaderOverlay.show();
                  },
                  onPageStarted: (String url) {},
                  onPageFinished: (String url) {
                    context.loaderOverlay.hide();
                  },
                  onHttpError: (HttpResponseError error) {
                    context.loaderOverlay.hide();
                  },
                  onWebResourceError: (WebResourceError error) {
                    context.loaderOverlay.hide();
                  },
                  onNavigationRequest: (NavigationRequest request) {
                    if (request.url.startsWith('https://www.youtube.com/')) {
                      return NavigationDecision.prevent;
                    }
                    return NavigationDecision.navigate;
                  },
                ),
              )
              ..loadRequest(
                Uri.parse(
                  state.pedigreeUrlModel.pedigreeUrl,
                ),
              ),
          );
        } else if (state is BreederPedigreeFail) {
          return MainErrorWidget(
            error: state.message,
            onTap: onTryAgainTap,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
