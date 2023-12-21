library driven_components_module;

import 'dart:async';

import 'package:driven_common/common/driven_constants.dart';
import 'package:driven_common/common/driven_dimensions.dart';
import 'package:driven_common/common/money_maker.dart';
import 'package:driven_common/common/name_id_object.dart';
import 'package:driven_common/common/semantic_strings.dart';
import 'package:driven_common/common/validation.dart';
import 'package:driven_common/extensions/extensions_module.dart';
import 'package:driven_common/styles/styles_module.dart';
import 'package:driven_common/utils/safe_launch.dart';
import 'package:driven_common/utils/utils_module.dart';
import 'package:flash/flash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intersperse/intersperse.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'buttons/dialog_button.dart';
part 'buttons/driven_button.dart';
part 'buttons/edit_button.dart';
part 'buttons/outlined_dialog_button.dart';
part 'buttons/outlined_primary_button.dart';
part 'buttons/outlined_signup_button.dart';
part 'buttons/primary_button.dart';
part 'buttons/rounded_button.dart';
part 'buttons/rounded_button_style.dart';
part 'buttons/underlined_button.dart';
// common widgets
part 'common_widgets/cupertino_progress_indicator.dart';
part 'common_widgets/driven_divider.dart';
part 'common_widgets/stepper_progress_indicator.dart';
// part 'complex_widgets/driven_flash_bar/driven_error_parser.dart';
// part 'complex_widgets/driven_flash_bar/driven_flash_bar.dart';
// part 'complex_widgets/driven_flash_bar/driven_flash_content.dart';
// part 'complex_widgets/driven_flash_bar/driven_flash_message.dart';
// part 'complex_widgets/driven_flash_bar/message_type.dart';
// part 'complex_widgets/inactivity_wrapper/inactivity_controller.dart';
// part 'complex_widgets/inactivity_wrapper/inactivity_wrapper.dart';
// part 'complex_widgets/app_logo.dart';
part 'complex_widgets/cancel_button.dart';
part 'complex_widgets/driven_back_button.dart';
part 'complex_widgets/driven_checkbox.dart';
part 'complex_widgets/help_tooltip.dart';
part 'complex_widgets/retry_button.dart';
part 'complex_widgets/switch.dart';
part 'complex_widgets/text_scale_clamp.dart';
part 'complex_widgets/toggle_switch_container.dart';
part 'dialogs/aligned_dialog.dart';
part 'dialogs/connectivity_error_dialog.dart';
part 'form_widgets/autocomplete_input.dart';
part 'form_widgets/borderless_input_field.dart';
part 'form_widgets/custom_text_field.dart';
part 'form_widgets/custom_text_form_field.dart';
part 'form_widgets/driven_custom_dropdown.dart';
part 'form_widgets/driven_dropdown_field.dart';
part 'form_widgets/driven_radio_button.dart';
part 'form_widgets/driven_radio_field.dart';
part 'form_widgets/driven_text_form_field.dart';
// part 'form_widgets/form_input.dart';
part 'form_widgets/hidden_icon_button.dart';
part 'form_widgets/inline_text_form_field.dart';
part 'form_widgets/input_field.dart';
part 'form_widgets/region_input.dart';
part 'form_widgets/text_formatters/currency_formatter.dart';
part 'form_widgets/text_formatters/express_code_formatter.dart';
part 'form_widgets/text_formatters/filtering_formatters.dart';
part 'form_widgets/text_formatters/masking_formatters.dart';
part 'form_widgets/text_formatters/text_formatters.dart';
part 'form_widgets/text_formatters/upper_case_formatter.dart';
part 'form_widgets/validators/autocomplete_required_validator.dart';
part 'form_widgets/validators/business_name_comdata_validator.dart';
part 'form_widgets/validators/business_name_validator.dart';
part 'form_widgets/validators/card_number_characters_validator.dart';
part 'form_widgets/validators/contain_space_validator.dart';
part 'form_widgets/validators/date_in_year_range_validator.dart';
part 'form_widgets/validators/email_must_match_validator.dart';
part 'form_widgets/validators/email_validator.dart';
part 'form_widgets/validators/email_validators.dart';
part 'form_widgets/validators/empty_check_validator.dart';
part 'form_widgets/validators/exclude_pattern_validator.dart';
part 'form_widgets/validators/fields_must_match_validator.dart';
part 'form_widgets/validators/has_at_least_n_characters_validator.dart';
part 'form_widgets/validators/has_n_digits_validator.dart';
part 'form_widgets/validators/has_validation.dart';
part 'form_widgets/validators/integer_validator.dart';
part 'form_widgets/validators/is_eight_digit_date_validator.dart';
part 'form_widgets/validators/is_month_year_date_validator.dart';
part 'form_widgets/validators/must_be_greater_validator.dart';
part 'form_widgets/validators/must_be_less_validator.dart';
part 'form_widgets/validators/must_equal_delete_validator.dart';
part 'form_widgets/validators/name_validator.dart';
part 'form_widgets/validators/no_po_box_validator.dart';
part 'form_widgets/validators/password_length_validator.dart';
part 'form_widgets/validators/password_regex_validator.dart';
part 'form_widgets/validators/password_validator.dart';
part 'form_widgets/validators/passwords_match_validator.dart';
part 'form_widgets/validators/phone_number_validator.dart';
part 'form_widgets/validators/pins_must_match_validator.dart';
part 'form_widgets/validators/positive_amount_validator.dart';
part 'form_widgets/validators/regex_generator.dart';
part 'form_widgets/validators/required_and_not_start_with_zero_validator.dart';
part 'form_widgets/validators/required_validator.dart';
part 'form_widgets/validators/security_question_answer_validator.dart';
part 'form_widgets/validators/username_not_recognized_validator.dart';
part 'form_widgets/validators/validator.dart';
part 'icon_widgets/close_icon.dart';
part 'simple_widgets/actions_layout.dart';
part 'simple_widgets/big_driven_logo.dart';
part 'simple_widgets/clear_focus_wrapper.dart';
part 'simple_widgets/dark_panel_title.dart';
part 'simple_widgets/divided_card.dart';
part 'simple_widgets/driven_bullet_text.dart';
part 'simple_widgets/driven_column.dart';
part 'simple_widgets/driven_dialog.dart';
part 'simple_widgets/driven_ellipsis_text.dart';
part 'simple_widgets/driven_rich_text.dart';
part 'simple_widgets/driven_tooltip_icon.dart';
part 'simple_widgets/fixed_spacer.dart';
part 'simple_widgets/hidden_review_panel.dart';
part 'simple_widgets/loading_text.dart';
part 'simple_widgets/menu_row.dart';
part 'simple_widgets/padded_divider.dart';
part 'simple_widgets/padded_row.dart';
part 'simple_widgets/padded_text.dart';
part 'simple_widgets/padded_text_fixed_font_size.dart';
part 'simple_widgets/page_content.dart';
part 'simple_widgets/password_icon.dart';
part 'simple_widgets/review_panel.dart';
part 'simple_widgets/signup_page_message.dart';
part 'simple_widgets/signup_page_title.dart';
part 'switch/driven_cupertino_switch.dart';
part 'templates/padded_content.dart';
part 'text_widgets/body1_regular14.dart';
part 'text_widgets/clickable_text.dart';
part 'text_widgets/contact_email.dart';
part 'text_widgets/credit_check_info_text.dart';
part 'text_widgets/format_string.dart';
part 'text_widgets/h1_regular24.dart';
part 'text_widgets/label_text.dart';
part 'text_widgets/multiline_text_regular14.dart';
part 'text_widgets/nav1_extra_bold12.dart';
part 'text_widgets/pointer_text.dart';
part 'text_widgets/rich_text_hyperlink.dart';
part 'text_widgets/send_to_text.dart';
part 'text_widgets/sub_title_text.dart';
part 'text_widgets/subtitle1_regular16.dart';
part 'text_widgets/title_text.dart';

// part 'text_widgets/view_large_title.dart'; // ViewLargeTitle exist
