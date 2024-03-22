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
    GetPage(name: "/", page: () => const Login()),
    GetPage(name: "/mylist", page: () => const MyList()),
    GetPage(name: "/SgtMyAccount", page: () => const SgtMyAccount()),
    GetPage(name: "/CreateRoute", page: () => const CreateRoute()),
    GetPage(name: "/Shift", page: () => const Shift()),
    GetPage(name: "/Properties", page: () => const Properties()),
    GetPage(name: "/SelectPlan", page: () => const SelectPlan()),
    GetPage(name: "/StackOver", page: () => const StackOver()),
    GetPage(name: '/AddNewGuard', page: () => const AddNewGuard()),
    GetPage(name: '/ProfilePage', page: () => const ProfilePage()),
    GetPage(name: '/AddressPage', page: () => const AddressPage())
  ];
}
