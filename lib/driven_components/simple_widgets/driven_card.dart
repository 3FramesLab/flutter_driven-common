part of driven_components_module;

class DrivenCard extends StatelessWidget {
  final String? title;
  final String? description;
  final Widget mainContent;
  final String bottomTitle;
  final String semanticLabel;
  final VoidCallback? onPressed;

  const DrivenCard({
    Key? key,
    this.title,
    this.description,
    required this.mainContent,
    required this.bottomTitle,
    required this.semanticLabel,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
    );
  }

  Widget get _mainContentBody => Container(
      decoration: const BoxDecoration(),
      width: Get.width,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        child: mainContent,
      ));

  Widget get _bottomTitle => Container(
        height: 48,
        decoration: const BoxDecoration(
          color: DrivenColors.lightBlue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Center(
          child: DrivenText(
            text: bottomTitle,
            style: f16SemiboldPrimary,
          ),
        ),
      );
}
