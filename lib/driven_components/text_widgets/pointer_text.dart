part of driven_components_module;

class PointerText extends StatelessWidget {
  final String text;
  const PointerText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      value: text,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(DrivenConstants.smallDot),
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Text(
                  text,
                  style: f16RegularBlack,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
