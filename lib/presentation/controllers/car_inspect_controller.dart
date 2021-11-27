import 'package:car_inspect/data/repositories_implement/inspect_repository_impl.dart';
import 'package:car_inspect/domain/entities/category.dart';
import 'package:car_inspect/domain/entities/inspect_info.dart';
import 'package:get/get.dart';

class CarInspectController extends GetxController {
  InspectInfoRepositoryImpl? _inspectInfoRepository;
  InspectInfo? inspectInfo;

  @override
  void onInit() {
    _inspectInfoRepository = InspectInfoRepositoryImpl();
    super.onInit();
  }

  Future<void> getInspectInfo() async {
    inspectInfo = await _inspectInfoRepository!.getInspectInfomation();
  }
}
