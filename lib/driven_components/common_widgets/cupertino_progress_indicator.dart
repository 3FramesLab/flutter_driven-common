part of driven_components_module;

class CupertinoProgressIndicator extends StatelessWidget {
  final bool showLoader;

  const CupertinoProgressIndicator({
    required this.showLoader,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showLoader
        ? Container(
            width: double.infinity,
            height: double.infinity,
            color: DrivenColors.transparent,
            child: const CupertinoActivityIndicator(
              radius: 25,
              color: DrivenColors.black,
            ),
          )
        : const SizedBox();
  }
}
