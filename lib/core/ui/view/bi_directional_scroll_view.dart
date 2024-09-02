import 'package:flutter/material.dart';

enum Direction {
  up,
  down;

  bool get isUp => this == up;

  bool get isDown => this == down;
}

class BiDirectionalScrollView extends StatefulWidget {
  final int centerItemPosition;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Function(Direction direction)? onLoadMore;
  final ScrollController controller;
  final EdgeInsets padding;

  const BiDirectionalScrollView({
    super.key,
    required this.itemBuilder,
    this.centerItemPosition = 0,
    required this.itemCount,
    required this.controller,
    this.onLoadMore,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  BiDirectionalScrollViewState createState() => BiDirectionalScrollViewState();
}

class BiDirectionalScrollViewState extends State<BiDirectionalScrollView> {
  Key centerKey = UniqueKey();

  int get bottomListItemCount => widget.itemCount - widget.centerItemPosition;

  int get safeBottomListItemCount =>
      bottomListItemCount < 5 ? bottomListItemCount : bottomListItemCount - 5;

  ValueNotifier<bool> nextItemsLoading = ValueNotifier(false);
  ValueNotifier<bool> prevItemsLoading = ValueNotifier(false);

  final GlobalKey listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: listKey,
      physics: const ClampingScrollPhysics(),
      controller: widget.controller,
      center: centerKey,
      slivers: [
        const SliverPadding(
          padding: EdgeInsets.only(top: 4),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: widget.padding.left,
            right: widget.padding.right,
            top: widget.padding.top,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var normalizedIndex = (widget.centerItemPosition - 1) - index;
                if (normalizedIndex < 5 && !prevItemsLoading.value) {
                  Future(() async {
                    prevItemsLoading.value = true;
                    await widget.onLoadMore?.call(Direction.up);
                    prevItemsLoading.value = false;
                  });
                }
                return widget.itemBuilder(context, normalizedIndex);
              },
              childCount: widget.centerItemPosition,
            ),
          ),
        ),
        SliverToBoxAdapter(
          key: centerKey,
          child: const SizedBox.shrink(),
        ),
        SliverPadding(
          padding: EdgeInsets.only(
            left: widget.padding.left,
            right: widget.padding.right,
            bottom: widget.padding.bottom,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var normalizedIndex = index + widget.centerItemPosition;
                if (index > safeBottomListItemCount &&
                    !nextItemsLoading.value) {
                  Future(() async {
                    nextItemsLoading.value = true;
                    await widget.onLoadMore?.call(Direction.down);
                    nextItemsLoading.value = false;
                  });
                }
                return widget.itemBuilder(context, normalizedIndex);
              },
              childCount: bottomListItemCount,
            ),
          ),
        ),
      ],
    );
  }
}
