part of driven_components_module;

class StepperRatingProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double radius;
  final Color? stepBackgroundColor;
  final Color defaultColor;

  const StepperRatingProgressIndicator({
    required this.currentStep,
    this.totalSteps = 3,
    this.radius = 12,
    this.stepBackgroundColor = DrivenColors.white,
    this.defaultColor = DrivenColors.primary,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        if (index == totalSteps - 1) {
          return _buildContainerStep(index + 1);
        }
        return Expanded(
          child: Row(
            children: [
              _buildContainerStep(index + 1),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildContainerStep(int step) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(
        color: _getBgColor(step),
        shape: BoxShape.circle,
        border: Border.all(
          color: _getBorderColor(step),
          width: 2,
        ),
      ),
      child: Center(
        child: SubTitleText(
          title: '$step',
          color: _getTextColor(step),
          fontWeight: FontWeight.w600,
          fontHeight: null,
        ),
      ),
    );
  }

  Color? _getBgColor(int step) => step == currentStep
      ? DrivenColors.primary
      : stepBackgroundColor ?? Colors.transparent;

  Color _getBorderColor(int step) =>
      step <= currentStep ? DrivenColors.white : DrivenColors.white;

  Color? _getTextColor(int step) {
    if (step < currentStep) {
      return Colors.black;
    } else if (step == currentStep) {
      return DrivenColors.white;
    }
    return DrivenColors.black;
  }
}
