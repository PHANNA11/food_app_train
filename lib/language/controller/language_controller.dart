import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLocalControlller extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en': {
          'hello': 'Hello',
          'dark_mode': 'Dark Mode',
          'light_mode': 'Light Mode',
          'setting': 'Settings',
          'dashboard': 'DashBoard',
          'community': 'Community',
          'about': 'About',
          'about_me': 'About Me',
          'top_sell': 'Top Sell',
          'sell_chart': 'Sell Chart',
          'about_product': 'About Product',
          'add_to_card': 'Add to Card',
          'product_not_have_qty': 'The Product don\'t have Qty..!!(0 qty)',
          'your_shopping_card': 'Your Shopping Card',
          'total': 'Total',
          'order': 'Order',
          'payment_order': 'Payment Order',
          'pay': 'Payment',
          'choose_credit_card': 'Choose Credit Card',
          'select_your_card': 'Select Your Caerd',
          'cancel': 'Cancel',
          'ok': 'ok',
          'add': 'Add',
          'fonts': 'Fonts',
          'language': 'Language'
        },
        'KH': {
          'hello': 'សួស្តី',
          'dark_mode': 'ផ្ទាំងពណ៌ខ្មៅ',
          'light_mode': 'ផ្ទាំងពណ៌ស',
          'setting': 'ការកំណត់',
          'dashboard': 'ផ្ទាំងគ្រប់គ្រង',
          'community': 'សហគមន៏',
          'about': 'អំពី',
          'about_me': 'អំពីខ្ញុំ',
          'top_sell': 'លក់ដាច់​ បំផុត',
          'sell_chart': 'តារាងលក់',
          'about_product': 'អំពី ផលិតផល',
          'add_to_card': 'បញ្ជូលទំនិញ',
          'product_not_have_qty': 'ផលិតផល មិនមានចំនួនកម្មង់​ (ចំនួន​ ០)!!!',
          'your_shopping_card': 'ទំនិញរបស់អ្នក ដែលបានរើស',
          'total': 'សរុប',
          'order': 'កម្មង់',
          'payment_order': 'ទូទាត់ការកម្មង់',
          'pay': 'ទូទាត់',
          'choose_credit_card': 'ជ្រើសរើស​ កាត​ឥណទាន',
          'select_your_card': 'ជ្រើសរើស​ កាត​ឥណទាន របស់អ្នក',
          'cancel': 'បោះបង់',
          'ok': 'យល់ព្រម',
          'add': 'បន្ថែម',
          'fonts': 'ពុម្ភអក្សរ',
          'language': 'ភាសា'
        }
      };
}

class SwitchLanguageController extends GetxController {
  RxBool english = false.obs;
  initLanguage() async {
    var prefs = await SharedPreferences.getInstance();

    english.value = prefs.getBool('engCode') ?? false;
    update();
    print(english.value);
    return english;
  }

  switchLanguage(bool eng) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool('engCode', eng);
    english.value = prefs.getBool('engCode') ?? false;
    update();
  }
}
