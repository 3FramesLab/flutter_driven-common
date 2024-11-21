part of driven_components_module;

class DrivenCustomDropDown extends StatelessWidget {
  final String selectedItem;
  final List<String> items;
  final ValueChanged<String> valueChanged;
  final GlobalKey _dropDownButtonKey = GlobalKey();
  final RxBool _isDropDownClicked = false.obs;
  final String placeholder;
  final String creditCheckInfoText;
  final Color borderColor;
  final Color selectedItemBorderColor;

  DrivenCustomDropDown({
    required this.selectedItem,
    required this.items,
    required this.valueChanged,
    this.placeholder = '',
    this.creditCheckInfoText = '',
    this.borderColor = DrivenColors.primary,
    this.selectedItemBorderColor = DrivenColors.primary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: _buttonStyle,
      onPressed: () => _showPopup(context),
      child: Column(
        children: [
          _dropDownContainer,
          if (creditCheckInfoText.isNotEmpty) _creditCheckInfoTextLabel(),
        ],
      ),
    );
  }

  Widget _creditCheckInfoTextLabel() {
    return CreditCheckInfoText(creditCheckInfoText);
  }

  ButtonStyle get _buttonStyle {
    return ButtonStyle(
      overlayColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.pressed)) {
            return Colors.transparent;
          }
          return null;
        },
      ),
      padding: WidgetStateProperty.all(EdgeInsets.zero),
    );
  }

  Future<void> _showPopup(BuildContext context) async {
    _isDropDownClicked(true);
    final box =
        _dropDownButtonKey.currentContext?.findRenderObject() as RenderBox;
    final offset = box.localToGlobal(Offset.zero);
    final size = box.size;
    final double top = offset.dy + size.height / 2 + 25;
    final double right = offset.dx;
    final result = await showDialog<String>(
      context: context,
      builder: (context) => Stack(
        children: [
          Positioned(
            top: top,
            right: right,
            width: size.width,
            height: items.length * 54.0,
            child: _buildDialog(context),
          ),
        ],
      ),
      useSafeArea: false,
      barrierColor: DrivenColors.lightGreyBlue,
    );
    if (result != null) {
      valueChanged(result);
    }
  }

  Widget _buildDialog(BuildContext context) => Material(
        color: DrivenColors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: _dialogContent(context),
        ),
      );

  Container _dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: DrivenColors.primary),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: _clipRReact(context),
    );
  }

  Widget _optionGesture(BuildContext context, String optionValue) {
    final gestureDetector = GestureDetector(
      onTap: () => _onOptionSelected(context, optionValue),
      behavior: HitTestBehavior.translucent,
      child: _optionItem(optionValue),
    );
    return gestureDetector;
  }

  void _onOptionSelected(BuildContext context, String optionValue) {
    _isDropDownClicked(false);
    Navigator.of(context).pop(optionValue);
  }

  Widget get _dropDownContainer => Container(
        key: _dropDownButtonKey,
        height: 50,
        decoration: _boxDecoration(),
        child: _selectedItem(),
      );

  Widget _selectedItem() {
    return Obx(
      () => Container(
        decoration: _selectedItemDecoration(),
        child: _selectedItemContent(),
      ),
    );
  }

  BoxDecoration _selectedItemDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: _isDropDownClicked() ? DrivenColors.primary : Colors.transparent,
      ),
    );
  }

  Widget _optionItem(String optionValue) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 44,
      color: (optionValue == selectedItem) ? Colors.white : null,
      child: Row(
        children: [
          Text(
            optionValue,
            style: f14RegularGrey,
          ),
        ],
      ),
    );
  }

  Widget _clipRReact(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: items.map(
          (optionValue) {
            return _optionGesture(context, optionValue);
          },
        ).toList(),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      border: const Border.fromBorderSide(
        BorderSide(color: DrivenColors.darkerGrey),
      ),
    );
  }

  Padding _selectedItemContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: PaddedRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        padding: const EdgeInsets.only(left: 2),
        children: [
          _getInitialValue(),
          const Icon(
            Icons.expand_more_rounded,
            size: 30,
            color: DrivenColors.grey,
          ),
        ],
      ),
    );
  }

  Widget _getInitialValue() {
    if (selectedItem == DrivenConstants.nullString) {
      return Text(
        placeholder,
        style: f14RegularLightGrey,
      );
    } else {
      return Text(
        selectedItem,
        style: f14RegularGrey,
      );
    }
  }
}
