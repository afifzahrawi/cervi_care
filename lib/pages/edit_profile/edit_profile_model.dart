import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  // State field(s) for officerid widget.
  FocusNode? officeridFocusNode;
  TextEditingController? officeridTextController;
  String? Function(BuildContext, String?)? officeridTextControllerValidator;
  // State field(s) for hospitalname widget.
  FocusNode? hospitalnameFocusNode;
  TextEditingController? hospitalnameTextController;
  String? Function(BuildContext, String?)? hospitalnameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    officeridFocusNode?.dispose();
    officeridTextController?.dispose();

    hospitalnameFocusNode?.dispose();
    hospitalnameTextController?.dispose();
  }

  /// Action blocks.
  Future uploadMedia(BuildContext context) async {}
}
