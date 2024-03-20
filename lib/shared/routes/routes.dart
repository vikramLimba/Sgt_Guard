import 'package:form_login/guard_&_assign_duty/new_guard/address_page/view/address_page.dart';
import 'package:form_login/guard_&_assign_duty/new_guard/profile_page/view/profile_page.dart';
import 'package:form_login/guard_&_assign_duty/add_new_guard.dart';
import 'package:form_login/sgt_pages/create_route.dart';
import 'package:form_login/practise_pages/list.dart';
import 'package:form_login/login.dart';
import 'package:form_login/sgt_pages/propeties.dart';
import 'package:form_login/sgt_pages/select_plan.dart';
import 'package:form_login/sgt_pages/sgt_my_account.dart';
import 'package:form_login/sgt_pages/shift.dart';
import 'package:form_login/test_code.dart';
import 'package:get/get.dart';

class RouteClass {
  static List<GetPage> routes = [
    GetPage(name: "/", page: () => Login()),
    GetPage(name: "/mylist", page: () => MyList()),
    GetPage(name: "/SgtMyAccount", page: () => SgtMyAccount()),
    GetPage(name: "/CreateRoute", page: () => CreateRoute()),
    GetPage(name: "/Shift", page: () => Shift()),
    GetPage(name: "/Properties", page: () => Properties()),
    GetPage(name: "/SelectPlan", page: () => SelectPlan()),
    GetPage(name: "/StackOver", page: () => StackOver()),
    GetPage(name: '/AddNewGuard', page: () => AddNewGuard()),
    GetPage(name: '/ProfilePage', page: () => ProfilePage()),
    GetPage(name: '/AddressPage', page: () => AddressPage())
  ];
}
