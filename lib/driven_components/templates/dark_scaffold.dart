part of driven_components_module;

class DarkScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBarLeading;
  final PreferredSizeWidget? appBar;

  DarkScaffold({
    super.key,
    List<Widget> body = const [],
    this.appBarLeading,
    this.appBar,
    List<Widget> footer = const [],
  }) : body = darkBody(body, footer);

  DarkScaffold.sectioned({
    super.key,
    List<Widget> upper = const [],
    List<Widget> middle = const [],
    List<Widget> lower = const [],
    this.appBarLeading,
    this.appBar,
  }) : body = SectionedBody(upper, middle, lower);

  @override
  Widget build(BuildContext context) {
    return TextScaleClamp(
      child: Scaffold(
        appBar: appBar ?? DarkLogoAppBar(leading: appBarLeading),
        backgroundColor: Colors.black,
        body: body,
      ),
    );
  }

  static Widget darkBody(List<Widget> body, List<Widget> footer) {
    return TextScaleClamp(
      child: DarkDrivenBackground(
        DrivenColumn(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          children: [
            Expanded(child: _content(body)),
            if (footer.isNotEmpty) _footer(footer),
          ],
        ),
      ),
    );
  }

  static Widget _content(List<Widget> body) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: body,
    );
  }

  static Widget _footer(List<Widget> footer) {
    return SizedBox(
      height: 150,
      child: Column(children: footer),
    );
  }
}

class DarkDrivenBackground extends StatelessWidget {
  final Widget body;

  const DarkDrivenBackground(this.body, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: DrivenColors.black90,
      child: body,
    );
  }
}

class SectionedBody extends StatelessWidget {
  final List<Widget> upper;
  final List<Widget> middle;
  final List<Widget> lower;

  const SectionedBody(this.upper, this.middle, this.lower, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextScaleClamp(
      child: LayoutBuilder(builder: (context, viewportConstraints) {
        final height = viewportConstraints.maxHeight;
        return SingleChildScrollView(
          child: DrivenColumn(
            color: DrivenColors.black90,
            padding: const EdgeInsets.symmetric(horizontal: 45),
            children: [
              DrivenColumn(
                minHeight: height * 0.71,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DrivenColumn(
                    minHeight: height * 0.25,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: upper,
                  ),
                  Column(
                    children: middle,
                  ),
                ],
              ),
              DrivenColumn(
                padding: const EdgeInsets.only(bottom: 10),
                mainAxisAlignment: MainAxisAlignment.center,
                children: lower,
              ),
            ],
          ),
        );
      }),
    );
  }
}
