part of driven_components_module;

class DrivenFlashAction {
  String? positiveButtonText;
  String? negativeButtonText;
  void Function()? onPositiveButtonTap;
  void Function()? onNagativeButtonTap;
  DrivenFlashAction({
    this.positiveButtonText,
    this.negativeButtonText,
    this.onPositiveButtonTap,
    this.onNagativeButtonTap,
  });
}
