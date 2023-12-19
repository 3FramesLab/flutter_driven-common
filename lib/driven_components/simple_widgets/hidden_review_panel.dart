part of driven_components_module;

class HiddenReviewPanel extends StatelessWidget {
  final Widget left;
  final Widget right;
  final Widget hiddenRight;
  final bool isBusinessReview;

  final RxBool isHidden = true.obs;

  HiddenReviewPanel({
    required this.left,
    required this.right,
    required this.hiddenRight,
    required this.isBusinessReview,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: left),
        Obx(
          () => Row(
            children: [
              _hiddenContent(),
              if (isBusinessReview)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: _hiddenReviewButton(),
                )
              else
                SizedBox(
                  width: 40,
                  child: _hiddenReviewButton(),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _hiddenContent() {
    return isHidden() ? hiddenRight : right;
  }

  IconButton _hiddenReviewButton() {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      onPressed: () {
        isHidden(!isHidden());
      },
      icon: isHidden() ? _hiddenIcon() : _visibleIcon(),
      color: DrivenColors.black90,
    );
  }

  Icon _hiddenIcon() {
    return const Icon(
      Icons.visibility_off_outlined,
      size: 20,
    );
  }

  Icon _visibleIcon() {
    return const Icon(
      Icons.visibility_outlined,
      size: 20,
    );
  }
}
