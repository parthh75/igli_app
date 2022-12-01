import 'package:igli_financial/utilities/string.dart';

class BusinessSetupModel {
  String? listTitle;
  String? subListTitleEx;
  String? subListTitleIn;
  String? pay;
  String? description;
  String? duration;
  String? deliverables;
  String? penalty;
  String? benefits;
  String? deliverablesTab;
  String? documents;

  BusinessSetupModel(
      {this.listTitle,
      this.subListTitleEx,
      this.subListTitleIn,
      this.pay,
      this.description,
      this.duration,
      this.deliverables,
      this.penalty,
      this.deliverablesTab,
      this.documents,
      this.benefits});
}
