import 'package:get/get.dart';

validInput(String val ,String type){
  if(val.isEmpty){
    return "$type Can't be Empty";
  }
  if (type == 'username') {
    if(! GetUtils.isUsername(val)){
      return 'not valid username';
    }
  }
  if (type == 'Email'.tr) {
    if(! GetUtils.isEmail(val)){
      return "not valid email";
    }
  }


}