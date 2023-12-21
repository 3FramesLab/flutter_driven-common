part of driven_components_module;

class ConnectivityErrorDialog extends StatelessWidget {
  final Function? dismissAction;

  const ConnectivityErrorDialog({
    this.dismissAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrivenDialog(
      text: const [TextSpan(text: DrivenConstants.webViewErrorMessage)],
      primaryButton: _dismissButton(context),
    );
  }

  Widget _dismissButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        Navigator.pop(context),
        if (dismissAction != null) dismissAction!(),
      },
      child: const Text(DrivenConstants.dismissSettingPopup),
    );
  }
}
