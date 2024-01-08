part of driven_components_module;

class DrivenFlashContent extends StatefulWidget {
  final Widget widget;
  const DrivenFlashContent({required this.widget, Key? key}) : super(key: key);

  @override
  State<DrivenFlashContent> createState() => _DrivenFlashContentState();
}

class _DrivenFlashContentState extends State<DrivenFlashContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _initAnimController();
    _initAnimation();
    _controller.forward();
  }

  void _initAnimController() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  void _initAnimation() {
    _animation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).viewInsets.top,
      child: SlideTransition(
        position: _animation,
        child: Material(
          color: Colors.transparent,
          child: widget.widget,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
