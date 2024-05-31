import '/flutter_flow/flutter_flow_util.dart';
import 'analysis_widget.dart' show AnalysisWidget;
import 'package:flutter/material.dart';

class AnalysisModel extends FlutterFlowModel<AnalysisWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode1;
  TextEditingController? fullNameTextController1;
  String? Function(BuildContext, String?)? fullNameTextController1Validator;
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode2;
  TextEditingController? fullNameTextController2;
  String? Function(BuildContext, String?)? fullNameTextController2Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode3;
  TextEditingController? fullNameTextController3;
  String? Function(BuildContext, String?)? fullNameTextController3Validator;
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode4;
  TextEditingController? fullNameTextController4;
  String? Function(BuildContext, String?)? fullNameTextController4Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fullNameFocusNode1?.dispose();
    fullNameTextController1?.dispose();

    fullNameFocusNode2?.dispose();
    fullNameTextController2?.dispose();

    fullNameFocusNode3?.dispose();
    fullNameTextController3?.dispose();

    fullNameFocusNode4?.dispose();
    fullNameTextController4?.dispose();
  }

  /// Action blocks.
  Future uploadMedia(BuildContext context) async {
    await uploadMedia(context);
  }
}
