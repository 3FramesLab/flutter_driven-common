part of driven_components_module;

class CloseIcon extends StatelessWidget {
  const CloseIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: SemanticStrings.closeIcon,
      child: GestureDetector(
        onTap: Get.back,
        child: Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2),
          ),
          padding: const EdgeInsets.all(4),
          child: const Icon(
            Icons.clear,
            color: DrivenColors.black,
            size: 24,
          ),
        ),
      ),
    );
  }
}
