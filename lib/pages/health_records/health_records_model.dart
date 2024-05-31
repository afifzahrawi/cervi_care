import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'health_records_widget.dart' show HealthRecordsWidget;
import 'package:flutter/material.dart';

class HealthRecordsModel extends FlutterFlowModel<HealthRecordsWidget> {
  ///  Local state fields for this page.

  List<ImagesRecord> history = [];
  void addToHistory(ImagesRecord item) => history.add(item);
  void removeFromHistory(ImagesRecord item) => history.remove(item);
  void removeAtIndexFromHistory(int index) => history.removeAt(index);
  void insertAtIndexInHistory(int index, ImagesRecord item) =>
      history.insert(index, item);
  void updateHistoryAtIndex(int index, Function(ImagesRecord) updateFn) =>
      history[index] = updateFn(history[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in HealthRecords widget.
  List<ImagesRecord>? fRecord;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ImagesRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
