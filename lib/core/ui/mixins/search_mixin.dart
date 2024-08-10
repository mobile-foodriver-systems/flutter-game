import 'package:flutter/material.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';

mixin SearchMixin<T extends StatefulWidget> on State<T> {
  void Function({String? searchText}) get load;

  final scrollController = ScrollController();

  Selectable? value;
  String? searchText;

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void initState() {
    super.initState();
    load();
    scrollController.addListener(_onScroll);
  }

  Future search(String searchString) async {
    if (searchString.trim().isEmpty) {
      return;
    }
    searchText = searchString;
    load(searchText: searchText);
  }

  Future clear() async {
    if (searchText?.isNotEmpty ?? false) {
      load();
    }
    value = null;
    searchText = null;
    setState(() {});
  }

  void select(Selectable selectavle) {
    value = selectavle;
    searchText = null;
    setState(() {});
  }

  void _onScroll() {
    if (_isBottom) {
      load(searchText: searchText);
    }
  }

  void unfocusSearchField() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
