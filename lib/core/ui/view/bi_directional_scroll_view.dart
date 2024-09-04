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
  final bool prevItemsLoading;
  final bool nextItemsLoading;

  const BiDirectionalScrollView({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    required this.controller,
    this.centerItemPosition = 0,
    this.padding = EdgeInsets.zero,
    this.onLoadMore,
    required this.prevItemsLoading,
    required this.nextItemsLoading,
  });

  @override
  BiDirectionalScrollViewState createState() => BiDirectionalScrollViewState();
}

class BiDirectionalScrollViewState extends State<BiDirectionalScrollView> {
  final UniqueKey centerKey = UniqueKey();
  final GlobalKey listKey = GlobalKey();

  int get bottomListItemCount => widget.itemCount - widget.centerItemPosition;

  int get safeBottomListItemCount =>
      bottomListItemCount < 5 ? bottomListItemCount : bottomListItemCount - 5;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: listKey,
      physics: const ClampingScrollPhysics(),
      controller: widget.controller,
      center: centerKey,
      slivers: [
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
                if (normalizedIndex < 5 && !widget.prevItemsLoading) {
                  Future(() async {
                    await widget.onLoadMore?.call(Direction.up);
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
                    !widget.nextItemsLoading) {
                  Future(() async {
                    await widget.onLoadMore?.call(Direction.down);
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
