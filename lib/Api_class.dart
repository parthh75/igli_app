import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:igli_financial/utilities/string.dart';
import '../main.dart';
const String somethingWrong = "Something went wrong!";
const String responseMessage = "No response data found!";
const String interNetMessage = "please check your internet connection and try again latter.";
const String connectionTimeOutMessage = "Ops.. Server not working or might be in maintenance. Please Try Again Later";
const String authenticationMessage = "The session has been expired. Please log in again.";
const String tryAgain = "Try again";
int serviceCallCount = 0;
// final storage = GetStorage();
///Status Code with message type array or string
// 501 : sql related err
// 401: validation array
// 201 : string error
// 400 : string error
// 200: response, string/null
// 422: array
class Api {
  getX.RxBool isLoadings = false.obs;
  call({
    required String serviceUrl,
    Map<String, dynamic>? params,
    required Function success,
    Function(Map<String, dynamic>)? error,
    ErrorMessageType errorMessageType = ErrorMessageType.snackBarOnlyError,
    MethodType methodType = MethodType.post,
    bool? isHideLoader = true,
    bool isProgressShow = true,
    bool isGoBack = true,
    bool isThreadParty = false,
    FormData? formValues,
  }) async {
    if (await checkInternet()) {
      if (isProgressShow) {
        showProgressDialog(isLoading: isProgressShow);
      }
      /*if (formValues != null) {
        Map<String, dynamic> tempMap = <String, dynamic>{};
        for (var element in formValues.fields) {
          tempMap[element.key] = element.value;
        }
        FormData reGenerateFormData = FormData.fromMap(tempMap);
        for (var element in formValues.files) {
          reGenerateFormData.files.add(MapEntry(element.key, element.value));
        }
        formValues = reGenerateFormData;
      }*/
      isLoadings.value = true;
      Map<String, dynamic> headerParameters = {};
      if (!isThreadParty) {
        headerParameters = {
          // if ((storage.read("loginToken") ?? "").toString().isNotEmpty) "authorization": "Bearer " + (storage.read("loginToken") ?? ""),
          "Authorization": getPreference.read(ApiConfig.loginToken) != null ? "Bearer " + getPreference.read(ApiConfig.loginToken) : "",
          "Accept": "application/json",
          // "timeZoneOffset": DateTime.now().timeZoneOffset,
          // "deviceType": kIsWeb
          //     ? "3"
          //     : Platform.isAndroid
          //         ? "1"
          //         : Platform.isIOS
          //             ? "2"
          //             : "4",
        };
      }
      String mainUrl = isThreadParty ? serviceUrl : serviceUrl;
      if (kDebugMode) {
        print('LOGIN TOKEN ${getPreference.read(ApiConfig.loginToken) ?? ""}');
        print(mainUrl);
        print(params);
      }
      // try {call chalu chhe ek minut ok
      Response response;
      if (methodType == MethodType.get) {
        response = await Dio().get(mainUrl,
            queryParameters: params,
            options: Options(
              headers: headerParameters,
              validateStatus: (status) {
                return (status! < 500);
              },
              responseType: ResponseType.plain,
            ));
      } else if (methodType == MethodType.put) {
        response = await Dio().put(mainUrl,
            data: params,
            options: Options(
              headers: headerParameters,
              validateStatus: (status) {
                return (status! < 500);
              },
              responseType: ResponseType.plain,
            ));
      } else {
        response = await Dio().post(mainUrl,
            data: formValues ?? params,
            options: Options(
              headers: headerParameters,
              validateStatus: (status) {
                return (status! < 500);
              },
              responseType: ResponseType.plain,
            ));
      }
      if (handleResponse(response)) {
        if (kDebugMode) {
          print("error code => " + response.statusCode.toString());
          print(response);
        }
        ///postman response Code guj
        Map<String, dynamic>? responseData;
        if (!isThreadParty) responseData = jsonDecode(response.data);
        if (isHideLoader!) {
          hideProgressDialog();
        }
        if (isThreadParty) {
          success(jsonDecode(response.data));
        } else if (responseData?["success"] ?? false) {
          //#region alert
          if (errorMessageType == ErrorMessageType.snackBarOnlySuccess || errorMessageType == ErrorMessageType.snackBarOnResponse) {
            getX.Get.snackbar("Success", responseData?["message"]);
          } else if (errorMessageType == ErrorMessageType.dialogOnlySuccess || errorMessageType == ErrorMessageType.dialogOnResponse) {
            await apiAlertDialog(message: responseData?["message"], buttonTitle: "Okay", isShowGoBack: isGoBack);
          }
          //#endregion alert
          if ((responseData?.containsKey("data") ?? false) &&
              (responseData?["data"] is Map) &&
              (responseData?["data"].containsKey("token") ?? false) &&
              (responseData?["data"]["token"].toString().isNotEmpty ?? false)) {
            getPreference.write("loginToken", responseData?["data"]["token"]);
          }
          success(responseData!);
        } else {
          //region 401 = Session Expired  Manage Authentication/Session Expire
          if (response.statusCode == 401 || response.statusCode == 403) {
            unauthorizedDialog(responseData?["message"]);
          } else {
            //#region alert
            if (errorMessageType == ErrorMessageType.snackBarOnlyError || errorMessageType == ErrorMessageType.snackBarOnResponse) {
              getX.Get.snackbar("Error", responseData?["message"]);
            } else if (errorMessageType == ErrorMessageType.dialogOnlyError || errorMessageType == ErrorMessageType.dialogOnResponse) {
              await apiAlertDialog(message: responseData?["message"], buttonTitle: "Okay", isShowGoBack: isGoBack);
            }
            //#endregion alert
            if (error != null) {
              error(responseData!);
            }
          }
          //endregion
        }
        isLoadings.value = false;
      } else {
        if (isHideLoader!) {
          hideProgressDialog();
        }
        showErrorMessage(
            message: responseMessage,
            isRecall: true,
            isGoBack: isGoBack,
            callBack: () {
              getX.Get.back();
              call(
                params: params,
                serviceUrl: serviceUrl,
                success: success,
                error: error,
                isProgressShow: isProgressShow,
                methodType: methodType,
                formValues: formValues,
                isHideLoader: isHideLoader,
                errorMessageType: errorMessageType,
                isGoBack: isGoBack,
                isThreadParty: isThreadParty,
              );
            });
        isLoadings.value = false;
      }
      isLoadings.value = false;
      // } on DioError catch (dioError) {
      //   //#region dioError
      //   dioErrorCall(
      //       dioError: dioError,
      //       onCallBack: (String message, bool isRecallError) {
      //         showErrorMessage(
      //             message: message,
      //             isGoBack: isGoBack,
      //             isRecall: isRecallError,
      //             callBack: () {
      //               if (serviceCallCount < 3) {
      //                 serviceCallCount++;
      //
      //                 if (isRecallError) {
      //                   getX.Get.back();
      //                   call(
      //                     params: params,
      //                     serviceUrl: serviceUrl,
      //                     success: success,
      //                     error: error,
      //                     isProgressShow: isProgressShow,
      //                     methodType: methodType,
      //                     formValues: formValues,
      //                     isHideLoader: isHideLoader,
      //                     errorMessageType: errorMessageType,
      //                     isGoBack: isGoBack,
      //                     isThreadParty: isThreadParty,
      //                   );
      //                 } else {
      //                   getX.Get.back(); // For redirecting to back screen
      //                 }
      //               } else {
      //                 getX.Get.back(); // For redirecting to back screen
      //                 // GeneralController.to.selectedTab.value = 0;
      //                 // getX.Get.offAll(() => DashboardTab());
      //               }
      //             });
      //       });
      //   isLoadings.value = false;
      //   //#endregion dioError
      // } catch (e) {
      //   //#region catch
      //   if (kDebugMode) {
      //     print(e);
      //   }
      //   hideProgressDialog();
      //   showErrorMessage(
      //       message: e.toString(),
      //       isGoBack: isGoBack,
      //       isRecall: true,
      //       callBack: () {
      //         getX.Get.back();
      //         call(
      //             params: params,
      //             serviceUrl: serviceUrl,
      //             success: success,
      //             error: error,
      //             isProgressShow: isProgressShow,
      //             methodType: methodType,
      //             formValues: formValues,
      //             isHideLoader: isHideLoader,
      //             errorMessageType: errorMessageType,
      //             isGoBack: isGoBack,
      //             isThreadParty: isThreadParty);
      //       });
      //   isLoadings.value = false;
      //   //#endregion catch
      // }
    } else {
      //#region No Internet
      showErrorMessage(
          message: interNetMessage,
          isRecall: true,
          isGoBack: isGoBack,
          callBack: () {
            getX.Get.back();
            call(
              params: params,
              serviceUrl: serviceUrl,
              success: success,
              error: error,
              isProgressShow: isProgressShow,
              methodType: methodType,
              formValues: formValues,
              isHideLoader: isHideLoader,
              errorMessageType: errorMessageType,
              isGoBack: isGoBack,
              isThreadParty: isThreadParty,
            );
          });
      //#endregion No Internet
    }
  }
}
showErrorMessage({required String message, required bool isRecall, required Function callBack, bool isGoBack = true}) {
  serviceCallCount = 0;
  // serviceCallCount++;
  hideProgressDialog();
  apiAlertDialog(
      buttonTitle: serviceCallCount < 3 ? tryAgain : "Restart App",
      message: message,
      buttonCallBack: () {
        callBack();
      },
      isShowGoBack: isGoBack);
}
void showProgressDialog({bool isLoading = true}) {
  // getX.Get.dialog(
  //   Lottie.asset('assets/data.json'),
  //   barrierDismissible: false,
  //   barrierColor: Colors.transparent,
  // );
  isLoading = true;
  // getX.Get.dialog(
  //     WillPopScope(
  //       onWillPop: () => Future.value(false),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: const [
  //           Center(child: CircularProgressIndicator()),
  //         ],
  //       ),
  //     ),
  //     barrierColor: Colors.black12,
  //     barrierDismissible: false);
}
void hideProgressDialog({bool isLoading = true, bool isProgressShow = true, bool isHideLoader = true}) {
  isLoading = false;
  if ((isProgressShow || isHideLoader) && getX.Get.isDialogOpen!) {
    getX.Get.back();
  }
}
dioErrorCall({required DioError dioError, required Function onCallBack}) {
  switch (dioError.type) {
    case DioErrorType.other:
    case DioErrorType.connectTimeout:
    // onCallBack(connectionTimeOutMessage, false);
      onCallBack(dioError.message, true);
      break;
    case DioErrorType.response:
    case DioErrorType.cancel:
    case DioErrorType.receiveTimeout:
    case DioErrorType.sendTimeout:
    default:
      onCallBack(dioError.message, true);
      break;
  }
}
Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
unauthorizedDialog(message) async {
  if (!getX.Get.isDialogOpen!) {
    getX.Get.dialog(
      WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: CupertinoAlertDialog(
          title: const Text('Health Pair'),
          content: Text(message ?? authenticationMessage),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text("Okay"),
              onPressed: () {
                getX.Get.back();
                //restart the application
                // storage.erase();
                // getX.Get.offAll(const SplashScreen());
              },
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      transitionCurve: Curves.easeInCubic,
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}
bool handleResponse(Response response) {
  try {
    if (isNotEmptyString(response.toString())) {
      return true;
    }
    else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

 isNotEmptyString(String string) {
  return string!=""||string!=null?string:"";
}

apiAlertDialog({required String message, String? buttonTitle, Function? buttonCallBack, bool isShowGoBack = true}) async {
 return CircularProgressIndicator(strokeWidth: 1.2,);
}
enum MethodType { get, post, put }
enum ErrorMessageType { snackBarOnlyError, snackBarOnlySuccess, snackBarOnResponse, dialogOnlyError, dialogOnlySuccess, dialogOnResponse,}