part of driven_components_module;

class DrivenCard extends StatelessWidget {
  final String? title;
  final String? description;
  final Widget mainContent;
  final String bottomTitle;
  final String semanticLabel;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry margin;

  const DrivenCard({
    Key? key,
    required this.mainContent,
    required this.semanticLabel,
    this.title,
    this.description,
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    this.bottomTitle = '',
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Card(
      elevation: 0,
      margin: margin,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        decoration: UiHelper.drivenCardBoxDecoration(),
        child: Semantics(
          container: true,
          label: semanticLabel,
          child: GestureDetector(
            onTap: onPressed,
            child: Column(
              children: [
                _mainContentBody,
                _bottomTitle,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _mainContentBody => Container(
      decoration: UiHelper.drivenCardBoxDecoration(
        borderRadius: bottomTitle.isEmpty
            ? const BorderRadius.all(Radius.circular(10))
            : const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
      ),
      width: Get.width,
      child: ClipRRect(
        child: mainContent,
      ));

  Widget get _bottomTitle => bottomTitle.isNotEmpty
      ? Container(
          height: 48,
          decoration: const BoxDecoration(
            color: DrivenColors.lightBlue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: DrivenText(
              text: bottomTitle.toString(),
              style: f16SemiboldPrimary,
            ),
          ),
        )
      : const SizedBox();
}
