import 'package:bunny_sync/features/breeder_details/cubit/breeder_details_cubit.dart';
import 'package:bunny_sync/global/theme/theme.dart';
import 'package:bunny_sync/global/widgets/loading_indicator.dart';
import 'package:bunny_sync/global/widgets/main_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  WebViewController? webViewController;

  @override
  void initState() {
    super.initState();

    breederDetailsCubit.getBreederPedigree(widget.breederId);
  }

  @override
  void onTryAgainTap() {
    breederDetailsCubit.getBreederPedigree(widget.breederId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreederDetailsCubit, GeneralBreederDetailsState>(
      listener: (context, state) {
        if (state is BreederPedigreeSuccess) {
          webViewController = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  breederDetailsCubit.emitPedigreeLoading();
                },
                onPageStarted: (String url) {},
                onPageFinished: (String url) {
                  breederDetailsCubit.emitPedigreeWebViewSuccess();
                },
                onHttpError: (HttpResponseError error) {},
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(
              Uri.parse(
                state.pedigreeUrlModel.pedigreeUrl,
              ),
            );
        }
      },
      buildWhen: (prev, curr) => curr is BreederPedigreeState,
      builder: (context, state) {
        final webViewController = this.webViewController;
        if (state is BreederPedigreeWebViewSuccess &&
            webViewController != null) {
          return WebViewWidget(
            controller: webViewController,
          );
        } else if (state is BreederPedigreeLoading) {
          return Center(
            child: LoadingIndicator(
              color: context.cs.primary,
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
