import 'package:car_inspect/domain/entities/inspect_info.dart';

abstract class InspectInfoRepository {
  Future<InspectInfo> getInspectInfomation();
}
