part of driven_components_module;

class CustomStarRatingWidget extends StatefulWidget {
  final int maxRating; // Maximum number of stars
  final double initialRating; // Initial rating value
  final Color activeColor; // Color for filled stars
  final Color inactiveColor; // Color for unfilled stars
  final Function(double) onRatingChanged; // Callback when rating changes

  const CustomStarRatingWidget({
    required this.onRatingChanged,
    Key? key,
    this.maxRating = 5,
    this.initialRating = 0,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);

  @override
  State<CustomStarRatingWidget> createState() => _CustomRatingWidgetState();
}

class _CustomRatingWidgetState extends State<CustomStarRatingWidget> {
  late double currentRating;

  @override
  void initState() {
    super.initState();
    currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxRating, (index) {
        final isFilled = index < currentRating.round();
        return GestureDetector(
          onTap: () {
            setState(() {
              currentRating = index + 1.0; // Update rating
            });
            widget.onRatingChanged(currentRating);
          },
          child: Icon(
            Icons.star,
            color: isFilled ? widget.activeColor : widget.inactiveColor,
            size: 30,
          ),
        );
      }),
    );
  }
}
