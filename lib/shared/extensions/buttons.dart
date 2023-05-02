import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:studyhive/shared/ui/spinner.dart';

extension LoadingElevatedButtonExtension on ElevatedButton {
  Widget withLoading({RxBool? loading, Icon? icon, String? text}) {
    var loadState = loading ?? RxBool(false);

    assert(icon == null && text == null || icon != null && text != null,
        'ElevatedButton must have both icon and label, or neither.');

    if (icon != null) {
      return Obx(() => loadState.value
          ? ElevatedButton.icon(
              onPressed: null,
              label: Text(text ?? ''),
              icon: const Spinner(
                size: SpinnerSize.sm,
              ),
            )
          : this);
    }
    return Obx(() => loadState.value
        ? const ElevatedButton(
            onPressed: null,
            child: Spinner(
              size: SpinnerSize.sm,
            ),
          )
        : this);
  }
}
