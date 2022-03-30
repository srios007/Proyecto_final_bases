import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/login/bindings/login_binding.dart';
import '../modules/onboarding/login/views/login_view.dart';
import '../modules/onboarding/register/bindings/register_binding.dart';
import '../modules/onboarding/register/views/register_view.dart';
import '../modules/services/assistance/bindings/assistance_binding.dart';
import '../modules/services/assistance/views/assistance_view.dart';
import '../modules/services/certificates/bindings/certificates_binding.dart';
import '../modules/services/certificates/certificates_detail/bindings/certificates_detail_binding.dart';
import '../modules/services/certificates/certificates_detail/views/certificates_detail_view.dart';
import '../modules/services/certificates/views/certificates_view.dart';
import '../modules/services/travel_expenses/bindings/travel_expenses_binding.dart';
import '../modules/services/travel_expenses/views/travel_expenses_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.REGISTER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.ASSISTANCE,
      page: () => AssistanceView(),
      binding: AssistanceBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.TRAVEL_EXPENSES,
      page: () => TravelExpensesView(),
      binding: TravelExpensesBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CERTIFICATES,
      page: () => CertificatesView(),
      binding: CertificatesBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: _Paths.CERTIFICATES_DETAIL,
      page: () => CertificatesDetailView(),
      binding: CertificatesDetailBinding(),
      transition: Transition.noTransition,
    ),
  ];
}
