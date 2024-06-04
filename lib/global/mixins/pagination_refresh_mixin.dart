import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

@optionalTypeArgs
mixin PaginationRefreshMixin<T extends StatefulWidget> on State<T> {
  ScrollController get scrollController;

  double offset = 0;

  bool isRefreshing = false;
  bool isLoadMore = false;

  bool get isLoading => isRefreshing || isLoadMore;

  Future<void> onHandleLoadMore();

  Future<void> onHandleRefresh();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    offset = MediaQuery.of(context).size.height * 0.25;

    scrollController.removeListener(paginationListener);
    scrollController.addListener(paginationListener);
  }

  @override
  void dispose() {
    scrollController.removeListener(paginationListener);

    super.dispose();
  }

  Future<void> paginationListener() async {
    onLoadMore();
  }

  Future<void> onRefresh() async {
    if (isLoading) {
      return;
    }
    try {
      setState(() {
        isRefreshing = true;
        isLoadMore = false;
      });
      await onHandleRefresh();
    } finally {
      setState(() {
        isRefreshing = false;
        isLoadMore = false;
      });
    }
  }

  Future<void> onLoadMore() async {
    if (isLoadMore) {
      return;
    }

    final max = scrollController.position.maxScrollExtent;
    final scrolled = scrollController.position.pixels;
    final scrollDown = scrollController.position.userScrollDirection ==
        ScrollDirection.reverse;

    if (max - scrolled <= offset && scrollDown) {
      try {
        setState(() {
          isLoadMore = true;
          isRefreshing = false;
        });
        await onHandleLoadMore();
      } finally {
        setState(() {
          isLoadMore = false;
          isRefreshing = false;
        });
      }
    }
  }
}
