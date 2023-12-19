part of '../otp_fields.dart';

class OtpFields extends StatefulWidget {
  final BuildContext parentContext;
  final int length;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final TextStyle? textStyle;
  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final OtpTheme otpTheme;
  final bool isAutoFill;

  const OtpFields({
    required this.parentContext,
    required this.length,
    required this.isAutoFill,
    this.otpTheme = const OtpTheme.defaults(),
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.textStyle,
    this.onChanged,
    this.onCompleted,
    Key? key,
  }) : super(key: key);

  @override
  _OtpFieldsState createState() => _OtpFieldsState();
}

class _OtpFieldsState extends State<OtpFields> with TickerProviderStateMixin {
  TextEditingController? _textEditingController;
  late FocusNode? _focusNode;
  late List<String> _inputList;
  int _selectedIndex = 0;
  BorderRadius? borderRadius;
  late AnimationController _cursorController;
  late Animation<double> _cursorAnimation;
  OtpTheme get _otpTheme => widget.otpTheme;
  TextStyle get _textStyle => f14SemiboldBlack;

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: <Widget>[
        _absorbPointer(),
        _otpFields(),
      ],
    );
  }

  Widget _absorbPointer() {
    return AbsorbPointer(
      child: AutofillGroup(child: _textField()),
    );
  }

  Widget _otpFields() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: _onFocus,
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _generateFields(),
        ),
      ),
    );
  }

  Widget _pinText({required int index}) {
    final text = _inputList[index];
    return Text(
      text,
      key: ValueKey(_inputList[index]),
      style: _textStyle,
    );
  }

  Widget _buildChild(int index) {
    if (canPaintCursor(index)) {
      if (_selectedIndex == index + 1 && widget.length == index + 1) {
        return Stack(
          alignment: Alignment.center,
          children: [
            _cursorPainter(true),
            _pinText(index: index),
          ],
        );
      } else {
        return _cursorPainter(false);
      }
    }
    return _pinText(index: index);
  }

  bool canPaintCursor(int index) =>
      ((_selectedIndex == index) ||
          (_selectedIndex == index + 1 && widget.length == index + 1)) &&
      (_focusNode?.hasFocus ?? false);

  Widget _cursorPainter(bool paddingRequired) {
    return Center(
      child: Padding(
        padding: paddingRequired
            ? EdgeInsets.only(left: (_textStyle.fontSize ?? 14) / 1.5)
            : EdgeInsets.zero,
        child: FadeTransition(
          opacity: _cursorAnimation,
          child: CustomPaint(
            size: const Size(0, 14),
            painter: CursorPainter(),
          ),
        ),
      ),
    );
  }

  List<Widget> _generateFields() {
    final result = <Widget>[];
    for (int i = 0; i < widget.length; i++) {
      result.add(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 6),
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 150),
            width: _otpTheme.fieldWidth,
            height: _otpTheme.fieldHeight,
            decoration: BoxDecoration(
              color: DrivenColors.transparent,
              borderRadius: borderRadius,
              border: Border.all(
                color: _borderColor(i),
                width: 1.8,
              ),
            ),
            child: Center(
              child: AnimatedSwitcher(
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                duration: const Duration(milliseconds: 150),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: _buildChild(i),
              ),
            ),
          ),
        ),
      );
    }
    return result;
  }

  void _onFocus() {
    if ((_focusNode?.hasFocus ?? false) &&
        MediaQuery.of(widget.parentContext).viewInsets.bottom == 0) {
      _focusNode?.unfocus();
      Future.delayed(const Duration(microseconds: 1), _focusNode?.requestFocus);
    } else {
      _focusNode?.requestFocus();
    }
  }

  void _setTextToInput(String data) {
    final replaceInputList = List<String>.filled(widget.length, '');

    for (int i = 0; i < widget.length; i++) {
      replaceInputList[i] = data.length > i ? data[i] : '';
    }

    if (mounted) {
      setState(() {
        _selectedIndex = data.length;
        _inputList = replaceInputList;
      });
    }
  }

  Widget _textField() {
    return TextFormField(
      controller: _textEditingController,
      focusNode: _focusNode,
      enabled: widget.enabled,
      autofillHints:
          widget.isAutoFill ? const [AutofillHints.oneTimeCode] : null,
      autofocus: true,
      keyboardType: TextInputType.number,
      inputFormatters: _inputFormatters,
      enableInteractiveSelection: false,
      showCursor: false,
      cursorWidth: 0.01,
      decoration: _inputDecoration(),
      style: _textFieldStyle(),
    );
  }

  TextStyle _textFieldStyle() {
    return const TextStyle(
      backgroundColor: DrivenColors.transparent,
      height: 0.01,
      fontSize: 0.01,
    );
  }

  InputDecoration _inputDecoration() {
    return const InputDecoration(
      contentPadding: EdgeInsets.all(0),
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    );
  }

  List<TextInputFormatter> get _inputFormatters {
    return [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(
        widget.length,
      ),
    ];
  }

  Color _borderColor(int index) {
    if (_selectedIndex == index) {
      return _otpTheme.selectedColor;
    } else {
      return DrivenColors.normalGrey;
    }
  }

  void _onCompleted(String text) {
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        if (widget.onCompleted != null) {
          widget.onCompleted!(text);
        }
      },
    );
    _focusNode?.unfocus();
  }

  void _onChanged(String text) {
    if (widget.onChanged != null) {
      widget.onChanged!(text);
    }
  }

  void _init() {
    _assignController();
    borderRadius = _otpTheme.borderRadius;
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode?.addListener(() {
      setState(() => {});
    });
    _inputList = List<String>.filled(widget.length, '');

    _cursorController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _cursorAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _cursorController,
      curve: Curves.easeIn,
    ));
    _cursorController.repeat();

    if ((_textEditingController?.text ?? '').isNotEmpty) {
      _setTextToInput(_textEditingController?.text ?? '');
    }
  }

  void _assignController() {
    if (widget.controller == null) {
      _textEditingController = TextEditingController();
    } else {
      _textEditingController = widget.controller;
    }

    _textEditingController?.addListener(() {
      final text = _textEditingController?.text ?? '';

      if (widget.enabled && _inputList.join() != text) {
        if (text.length >= widget.length) {
          _onCompleted(text);
        }
        _onChanged(text);
      }

      _setTextToInput(text);
    });
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    _focusNode?.dispose();
    _cursorController.dispose();
    super.dispose();
  }
}
