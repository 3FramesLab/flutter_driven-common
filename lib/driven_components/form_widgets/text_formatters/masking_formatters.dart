part of driven_components_module;

MaskTextInputFormatter get einInputMask => MaskTextInputFormatter(
      mask: 'XX-XXXXXXX',
      filter: {'X': RegExp('[0-9]')},
    );

MaskTextInputFormatter get ssnInputMask => MaskTextInputFormatter(
      mask: 'XXX-XX-XXXX',
      filter: {'X': RegExp('[0-9]')},
    );
