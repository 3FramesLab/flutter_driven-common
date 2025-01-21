part of driven_components_module;

class DrivenRatingsButtons extends StatelessWidget {
  final RxBool isSentimentVeryDissatisfiedEnabled = false.obs;
  final RxBool isSentimentDissatisfiedEnabled = false.obs;
  final RxBool isSentimentNeutralEnabled = false.obs;
  final RxBool isSentimentSatisfiedEnabled = false.obs;
  final RxBool isSentimentVerySatisfiedEnabled = false.obs;
  final double bottomPadding;
  final Function(int) onRatingSelection;
  final String ratingTitle;
  final String ratingRemarkLeft;
  final String ratingRemarkRight;
  final String sentimentsVeryDissatisfiedIcon;
  final String sentimentsDissatisfiedIcon;
  final String sentimentsNeutralIcon;
  final String sentimentsSatisfiedIcon;
  final String sentimentsVerySatisfiedIcon;
  final String radioIcon;
  DrivenRatingsButtons({
    required this.ratingTitle,
    required this.onRatingSelection,
    required this.sentimentsVeryDissatisfiedIcon,
    required this.sentimentsDissatisfiedIcon,
    required this.sentimentsNeutralIcon,
    required this.sentimentsSatisfiedIcon,
    required this.sentimentsVerySatisfiedIcon,
    required this.radioIcon,
    this.ratingRemarkLeft = '',
    this.ratingRemarkRight = '',
    this.bottomPadding = 30,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ratingTitle(),
        Obx(_getRating),
      ],
    );
  }

  Widget _ratingTitle() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: DrivenText(
          text: ratingTitle,
          style: f16RegularGrey,
        ));
  }

  void onSentimentVeryDissatisfied() {
    isSentimentVeryDissatisfiedEnabled(true);
    isSentimentDissatisfiedEnabled(false);
    isSentimentNeutralEnabled(false);
    isSentimentSatisfiedEnabled(false);
    isSentimentVerySatisfiedEnabled(false);
    onRatingSelection(1);
  }

  void onSentimentDissatisfied() {
    isSentimentVeryDissatisfiedEnabled(false);
    isSentimentDissatisfiedEnabled(true);
    isSentimentNeutralEnabled(false);
    isSentimentSatisfiedEnabled(false);
    isSentimentVerySatisfiedEnabled(false);
    onRatingSelection(2);
  }

  void onSentimentNeutral() {
    isSentimentVeryDissatisfiedEnabled(false);
    isSentimentDissatisfiedEnabled(false);
    isSentimentNeutralEnabled(true);
    isSentimentSatisfiedEnabled(false);
    isSentimentVerySatisfiedEnabled(false);
    onRatingSelection(3);
  }

  void onSentimentSatisfied() {
    isSentimentVeryDissatisfiedEnabled(false);
    isSentimentDissatisfiedEnabled(false);
    isSentimentNeutralEnabled(false);
    isSentimentSatisfiedEnabled(true);
    isSentimentVerySatisfiedEnabled(false);
    onRatingSelection(4);
  }

  void onSentimentVerySatisfied() {
    isSentimentVeryDissatisfiedEnabled(false);
    isSentimentDissatisfiedEnabled(false);
    isSentimentNeutralEnabled(false);
    isSentimentSatisfiedEnabled(false);
    isSentimentVerySatisfiedEnabled(true);
    onRatingSelection(5);
  }

  Widget _getRating() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: 2, bottom: bottomPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            getRatingRowItem(
              isSentimentVeryDissatisfiedEnabled,
              sentimentsVeryDissatisfiedIcon,
              radioIcon,
              onSentimentVeryDissatisfied,
              '1',
              ratingRemark: ratingRemarkLeft,
            ),
            getRatingRowItem(
              isSentimentDissatisfiedEnabled,
              sentimentsDissatisfiedIcon,
              radioIcon,
              onSentimentDissatisfied,
              '2',
            ),
            getRatingRowItem(
              isSentimentNeutralEnabled,
              sentimentsNeutralIcon,
              radioIcon,
              onSentimentNeutral,
              '3',
            ),
            getRatingRowItem(
              isSentimentSatisfiedEnabled,
              sentimentsSatisfiedIcon,
              radioIcon,
              onSentimentSatisfied,
              '4',
            ),
            getRatingRowItem(
              isSentimentVerySatisfiedEnabled,
              sentimentsVerySatisfiedIcon,
              radioIcon,
              onSentimentVerySatisfied,
              '5',
              ratingRemark: ratingRemarkRight,
            ),
          ],
        ),
      ),
    );
  }

  Widget getRatingRowItem(
    RxBool isEnabled,
    String enabledIcon,
    String disabledIcon,
    VoidCallback? onPressed,
    String rating, {
    String ratingRemark = '',
  }) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: SvgImage(
                svgPath: isEnabled() ? enabledIcon : disabledIcon,
                height: 28,
                width: 28,
              ),
            ),
            DrivenText(text: rating),
            const SizedBox(width: 14),
          ],
        ),
        if (ratingRemark.isNotEmpty)
          DrivenText(
            text: ratingRemark,
            style: f14SemiboldGrey,
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}
