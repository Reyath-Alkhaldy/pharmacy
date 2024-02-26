import 'package:get/get.dart';
import 'package:new_maps/controller/get_storage_controller.dart';
import 'package:new_maps/core/class/handingdatacontroller.dart';
import 'package:new_maps/data/database/remote/get_data.dart';
import 'package:new_maps/core/class/status_request.dart';
import 'package:new_maps/data/models/user.dart';
import '../../../core/utils/constant/export_constant.dart';
// import 'package:restart_app/restart_app.dart' as S;
abstract class LogoutController extends GetxController {
  logoutProcessing();
  logout();
}

class LogoutControllerImp extends LogoutController {
  GetData getData = GetData(Get.find());
  GetStorageControllerImp getStorage = Get.find();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  UserResponse? userResponse;
// ! Authorization Bearer
  get authorizationToken => {'Authorization': 'Bearer ${userResponse!.token}'};

  @override
  void onInit() {
    super.onInit();
    userResponse = getStorage.getUserResponse('user')!;
  }

  @override
  logoutProcessing() async {
    statusRequest.value = StatusRequest.loading;
    var response = await getData.deleteData(
        'auth/access-tokens/${userResponse!.token}',
        {},
        userResponse != null ? authorizationToken : {});
    statusRequest.value = handlingData(response);

    if (statusRequest.value == StatusRequest.success) {
      if (response['status'] == 'success') {
        await showDialogg('title', 'تم تسجيل الخروج');
      } else {
        statusRequest.value = StatusRequest.success;
        await showDialogg('title', response['message']);
      }
    }
    if (response['message'] == 'Unauthenticated.') {
      await showDialogg('message', response['message']);
    } else if (statusRequest.value == StatusRequest.serverfailure) {
      statusRequest.value = StatusRequest.success;
      await showDialogg('خطأ', 'هناك خطأ في السيرفر');
    }
  }

  @override
  logout() async {
    await showDialogLogout('تسجيل الخروج', 'تأكيد تسجيل الخروج',
        onTap: () async {
      // await getStorage.instance.remove('user');
      await Get.deleteAll(force: true); //deleting all controllers
      // Phoenix.rebirth(Get.context!); // Restarting app
      Get.reset(); // resetting getx
      // Restart.restartApp( );
      // RestartWidget

    });
  }
}
