part of driven_components_module;

MaskTextInputFormatter get expressCodeFormatter => MaskTextInputFormatter(
      mask: '#### #### #### #### #### #### #',
      filter: {'#': RegExp('[0-9]')},
    );
