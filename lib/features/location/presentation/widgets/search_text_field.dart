import 'package:flutter/material.dart';
import 'package:food_driver/core/ui/assets/assets_catalog.dart';
import 'package:food_driver/core/ui/colors/app_colors.dart';
import 'package:food_driver/features/location/data/models/selectable.dart';

class SearchTextField<T extends Selectable> extends StatefulWidget {
  final VoidCallback? search;
  final VoidCallback? clear;
  final T? value;
  final String label;

  const SearchTextField({
    super.key,
    this.search,
    this.clear,
    this.value,
    required this.label,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState<T>();
}

class _SearchTextFieldState<T extends Selectable>
    extends State<SearchTextField<T>> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  bool editable = false;

  @override
  void initState() {
    if (widget.value?.name?.isNotEmpty ?? false) {
      controller.text = widget.value!.name!;
    }
    focusNode.addListener(focusListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const BoxConstraints iconConstraints = BoxConstraints(
      maxHeight: 32.0,
      maxWidth: 34.0,
    );
    const TextStyle textStyle = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );
    return Stack(
      children: [
        TextField(
          controller: controller,
          focusNode: focusNode,
          style: textStyle,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
            fillColor: AppColors.textFieldGray,
            prefixIconConstraints: iconConstraints,
            prefixIcon: IconButton(
              icon: Image.asset(AssetsCatalog.icSearch),
              onPressed: widget.search,
            ),
            suffixIconConstraints: iconConstraints,
            suffixIcon: IconButton(
              icon: Image.asset(AssetsCatalog.icClear),
              onPressed: widget.clear,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.words,
        ),
        if (widget.value != null && !(editable && widget.value != null))
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(focusNode);
              setState(() {
                editable = !editable;
              });
            },
            child: DecoratedBox(
              decoration:
                  const BoxDecoration(color: AppColors.dialogBackgroundColor),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: AppColors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.label,
                        style: const TextStyle(
                          color: AppColors.labelRed,
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        widget.value?.name ?? "",
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  void focusListener() {
    if (!focusNode.hasFocus && widget.value != null) {
      editable = false;
      controller.text = widget.value?.name ?? "";
      setState(() {});
    }
  }
}
