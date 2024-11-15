import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // SignIn
  {
    'ex3qgtz1': {
      'en': 'Natech PoultryPro',
      'fr': '',
    },
    'xpgq77qt': {
      'en': 'Login your account',
      'fr': '',
    },
    'f20gnsg9': {
      'en': 'Please user fill the following information to continue.',
      'fr': '',
    },
    'v09hsd02': {
      'en': 'Email',
      'fr': '',
    },
    'g421lbq8': {
      'en': 'Enter your email',
      'fr': '',
    },
    '0rhk1zrm': {
      'en': 'Password',
      'fr': '',
    },
    'fveubtin': {
      'en': 'Enter your password',
      'fr': '',
    },
    'wlkuzjnr': {
      'en': 'Login',
      'fr': '',
    },
    '5ehjdryw': {
      'en': 'Forgot Password?',
      'fr': '',
    },
    '6md6wnn0': {
      'en': 'OR',
      'fr': '',
    },
    'f737w7ke': {
      'en': 'Continue with Google',
      'fr': '',
    },
    '2d71qg58': {
      'en': 'Continue with Facebook',
      'fr': '',
    },
    '0r71bwfu': {
      'en': 'Don\'t have an account? ',
      'fr': '',
    },
    'qgs6cxs2': {
      'en': ' Sign Up',
      'fr': '',
    },
    '0xcbpbjm': {
      'en': 'Terms and Conditions',
      'fr': '',
    },
  },
  // AboutUs
  {
    'kbv22nwf': {
      'en': 'Welcome to Poultry Farm',
      'fr': '',
    },
    '5o1mzunz': {
      'en': 'Your one-stop planner for all things about poultry',
      'fr': '',
    },
    'ebmc60kh': {
      'en': 'About Us',
      'fr': '',
    },
    'uf6y5bda': {
      'en':
          'At Natech PoultryPro, we are passionate about providing high-quality poultry products to our customers. With years of experience in the industry, we have built a reputation for delivering fresh and delicious poultry products that meet the highest standards of quality and safety. Whether you\'re looking for chicken, turkey, or duck, we have a wide selection of products to choose from. We also offer a range of poultry-related services, including poultry farming advice and consulting. Visit us today and experience the difference of Poultry Farm.',
      'fr': '',
    },
    'papmoojm': {
      'en': 'Contact Us',
      'fr': '',
    },
    'cz7zshy8': {
      'en': 'support@na-kandaconsultancy.com',
      'fr': '',
    },
    't0k565ab': {
      'en': '+260 766 949 665',
      'fr': '',
    },
    '0a1tzimm': {
      'en': 'tech.happylight.rw',
      'fr': '',
    },
    'o96nds37': {
      'en': 'Natech PoultryPro',
      'fr': '',
    },
  },
  // user
  {
    'othrglrn': {
      'en': 'Your Name',
      'fr': '',
    },
    '2zx1lzq6': {
      'en': 'Enter Your Name',
      'fr': '',
    },
    'ds0j5nj8': {
      'en': 'Your Email Address',
      'fr': '',
    },
    '94240gz2': {
      'en': 'Enter Your Email',
      'fr': '',
    },
    'zy30y1da': {
      'en': 'Your Phone Number',
      'fr': '',
    },
    '7upaq86m': {
      'en': '+260 789 123 456',
      'fr': '',
    },
    '8xiwd6wn': {
      'en': 'Save Changes',
      'fr': '',
    },
    'cb2h11ci': {
      'en': 'Update your Profile',
      'fr': '',
    },
  },
  // signUp
  {
    '68lq85nn': {
      'en': 'Natech PoultryPro',
      'fr': '',
    },
    'aeuxn8os': {
      'en': 'Create an account',
      'fr': '',
    },
    'z2hlh7jh': {
      'en': 'Please user fill the following information to continue.',
      'fr': '',
    },
    'sgm4mqxa': {
      'en': 'Full Name',
      'fr': '',
    },
    'clhxqmt8': {
      'en': 'Enter your full name',
      'fr': '',
    },
    '5zfyhmy7': {
      'en': 'Email',
      'fr': '',
    },
    'ks3xmdvq': {
      'en': 'Enter your email',
      'fr': '',
    },
    'gblsnywo': {
      'en': 'Password',
      'fr': '',
    },
    'q1ha6s56': {
      'en': 'Enter your password',
      'fr': '',
    },
    'k15bggss': {
      'en': 'Confirm Password',
      'fr': '',
    },
    '497aw3i0': {
      'en': 'Confirm your password',
      'fr': '',
    },
    '92xdeeta': {
      'en': 'Create Account',
      'fr': '',
    },
    'xhtjzlw0': {
      'en': 'OR',
      'fr': '',
    },
    'glnzb66j': {
      'en': 'Continue with Google',
      'fr': '',
    },
    'wgni6nz5': {
      'en': 'Continue with Facebook',
      'fr': '',
    },
    'qkuflq0f': {
      'en': 'Already have an account? ',
      'fr': '',
    },
    '48vlk78k': {
      'en': ' Sign In',
      'fr': '',
    },
    'uaj54al9': {
      'en': 'Terms and Conditions',
      'fr': '',
    },
    '0aeyfb7q': {
      'en': 'Home',
      'fr': '',
    },
  },
  // onboard
  {
    '5jecl89m': {
      'en': 'Welcome to Poultry Planner',
      'fr': '',
    },
    'um2hwy1m': {
      'en':
          'Calculate capital investment totals, track consumables, and analyze your profit margins based on the number of chickens you plan to rear.',
      'fr': '',
    },
    'y4dzohq9': {
      'en': 'Capital Investment',
      'fr': '',
    },
    'jh53v3bl': {
      'en':
          'Our tool provides a comprehensive breakdown to help you plan your budget effectively.',
      'fr': '',
    },
    'bm0xs99u': {
      'en': 'Track Consumables',
      'fr': '',
    },
    '5mk32az6': {
      'en':
          'Our app gives you detailed insights and helps you make informed decisions to maximize your returns.',
      'fr': '',
    },
    '2u1fy740': {
      'en': 'Skip',
      'fr': '',
    },
    'n42x33ey': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Settings
  {
    'u0bpvowe': {
      'en': 'Settings',
      'fr': '',
    },
    'se1xskt4': {
      'en': 'Please evaluate your options below.',
      'fr': '',
    },
    '5ntqisgx': {
      'en': 'My Subscription',
      'fr': '',
    },
    'mckd8au5': {
      'en': 'About Us',
      'fr': '',
    },
    'mlvpmxy1': {
      'en': 'Help',
      'fr': '',
    },
    'svcjizxy': {
      'en': 'Privacy Policy',
      'fr': '',
    },
    '18wy09h4': {
      'en': 'Terms & Conditions',
      'fr': '',
    },
    'kcb7diqd': {
      'en': 'Follow us on',
      'fr': '',
    },
    '3nvv5y73': {
      'en': 'App Versions',
      'fr': '',
    },
    'ohadubxc': {
      'en': 'v0.0.1',
      'fr': '',
    },
    'rmqv1i87': {
      'en': 'Log Out',
      'fr': '',
    },
    'bj8iwcvj': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Home
  {
    'geqq06go': {
      'en': 'Select a Page or Component',
      'fr': '',
    },
    'aslcltfc': {
      'en': 'Poultry Project Cost',
      'fr': '',
    },
    'znks76wt': {
      'en': 'Poultry Project Cost',
      'fr': '',
    },
    '2di2uvl4': {
      'en': 'Capital Investment',
      'fr': '',
    },
    '5juwpigw': {
      'en': 'Consumables',
      'fr': '',
    },
    'ayagfyau': {
      'en': 'Feed Mixer',
      'fr': '',
    },
    'stgsdf9k': {
      'en': 'Comprehensive Feed Mixing Data',
      'fr': '',
    },
    'eiqtqe4p': {
      'en': 'Please select...',
      'fr': '',
    },
    '4ftc0ee2': {
      'en': 'Search for a page...',
      'fr': '',
    },
    'a4k0yiuf': {
      'en': 'Chicken Planner',
      'fr': '',
    },
    'h6dp4qm0': {
      'en': 'Edit the price list for the capital investment.',
      'fr': '',
    },
    'zlxrwdy8': {
      'en': 'Edit',
      'fr': '',
    },
    '5ukmg46nm':{
      'en': 'Management Tool',
    }, 
    '4nixk8gw': {
      'en': 'CAPITAL INVESTMENT TOTALS',
      'fr': '',
    },
    'xdj774vm': {
      'en': 'Poultry Houses',
      'fr': '',
    },
    'xp7z4a8y': {
      'en': 'Drinkers ',
      'fr': '',
    },
    'd4cogxdu': {
      'en': 'Feeders',
      'fr': '',
    },
    's1d9is8g': {
      'en': 'Brooders',
      'fr': '',
    },
    'xb29oed6': {
      'en': 'Infrared Lamp ',
      'fr': '',
    },
    'xjdbqaet': {
      'en': 'Borehole',
      'fr': '',
    },
    'rz20zax7': {
      'en': 'Sets of tools ',
      'fr': '',
    },
    'absw0eal': {
      'en': 'CONSUMABLES',
      'fr': '',
    },
    'yp0xoqyj': {
      'en': 'Edit the price list for the consumables.',
      'fr': '',
    },
    'newqhso3': {
      'en': 'Edit',
      'fr': '',
    },
    'ixk1h6yd': {
      'en': 'With Bought Feed ',
      'fr': '',
    },
    '7lrzyria': {
      'en': 'With Farm Made Feed',
      'fr': '',
    },
    'i964mwns': {
      'en': 'With Concentrate - Cereal Mix Feed',
      'fr': '',
    },
    'fqdajlr3': {
      'en': 'Selling cost',
      'fr': '',
    },
    '2oyxxxi8': {
      'en': 'With Bought Feed  ',
      'fr': '',
    },
    'uxt030gr': {
      'en': 'With Farm Made Feed',
      'fr': '',
    },
    'ng2ejh98': {
      'en': 'With Concentrate - Cereal Mix Feed',
      'fr': '',
    },
    'scsy3qok': {
      'en': 'Transport',
      'fr': '',
    },
    '9w47wkdd': {
      'en': 'With Bought Feed  ',
      'fr': '',
    },
    'j6nv722y': {
      'en': 'With Farm Made Feed ',
      'fr': '',
    },
    '5g57f16g': {
      'en': 'With Concentrate - Cereal Mix Feed',
      'fr': '',
    },
    '7wu5727w': {
      'en': 'With Bought Feed  ',
      'fr': '',
    },
    'wfnbu9p1': {
      'en': 'With Farm Made Feed ',
      'fr': '',
    },
    'n8n36adp': {
      'en': 'With Concentrate - Cereal Mix Feed',
      'fr': '',
    },
    'cazmvtuu': {
      'en': 'With Bought Feed  ',
      'fr': '',
    },
    'l2ptrul2': {
      'en': 'With Farm Made Feed ',
      'fr': '',
    },
    'tadmo8xp': {
      'en': 'With Concentrate - Cereal Mix Feed',
      'fr': '',
    },
    'sc388tjv': {
      'en': 'Power Consumption',
      'fr': '',
    },
    '30wqq94y': {
      'en': 'With Bought Feed  ',
      'fr': '',
    },
    'l970xv0s': {
      'en': 'With Farm Made Feed ',
      'fr': '',
    },
    '0wu9yrvb': {
      'en': 'With Concentrate - Cereal Mix Feed',
      'fr': '',
    },
    '4wfscpjv': {
      'en': 'Litter',
      'fr': '',
    },
    '38yh3jdd': {
      'en': 'With Bought Feed  ',
      'fr': '',
    },
    'xcneixci': {
      'en': 'With Farm Made Feed',
      'fr': '',
    },
    '9gf9amas': {
      'en': 'With Concentrate - Cereal Mix Feed',
      'fr': '',
    },
    '9athdbw1': {
      'en': 'Labour',
      'fr': '',
    },
    '1va41c25': {
      'en': 'With Bought Feed ',
      'fr': '',
    },
    '798hpq9j': {
      'en': 'With Farm Made Feed ',
      'fr': '',
    },
    'qoqgs1fh': {
      'en': 'With Concentrate - Cereal Mix Feed',
      'fr': '',
    },
    'go4m5wl1': {
      'en': 'Poultry Project Cost',
      'fr': '',
    },
    'ngajlf42': {
      'en': 'Below is a farm overview',
      'fr': '',
    },
    'usvkmwv7': {
      'en': 'With Bought Feed',
      'fr': '',
    },
    'ywxk8wt2': {
      'en': 'Capital  Investment',
      'fr': '',
    },
    'vtk86wmr': {
      'en': 'Cost of Chicks',
      'fr': '',
    },
    '8lhvmnb3': {
      'en': 'Running Costs',
      'fr': '',
    },
    '8l35ifig': {
      'en': 'Total Sales',
      'fr': '',
    },
    'z9014a66': {
      'en': 'Profit Margins',
      'fr': '',
    },
    'y3qrv837': {
      'en': 'Production Cost / Chicken',
      'fr': '',
    },
    'zbot9wia': {
      'en': 'With Farm Made Feed',
      'fr': '',
    },
    'qexkv333': {
      'en': 'Capital  Investment',
      'fr': '',
    },
    'xd2jy8wz': {
      'en': 'Cost of Chicks',
      'fr': '',
    },
    '40fzrnhb': {
      'en': 'Running Costs',
      'fr': '',
    },
    'nm83u3l2': {
      'en': 'Total Sales',
      'fr': '',
    },
    'icymzok3': {
      'en': 'Profit Margins',
      'fr': '',
    },
    '69cnlsv3': {
      'en': 'Production Cost / Chicken',
      'fr': '',
    },
    'drkmvv03': {
      'en': 'With Concentrate - Cereal Mix Feed',
      'fr': '',
    },
    '6alecozf': {
      'en': 'Capital  Investment',
      'fr': '',
    },
    'l79f13j3': {
      'en': 'Cost of Chicks',
      'fr': '',
    },
    'cr1kenul': {
      'en': 'Running Costs',
      'fr': '',
    },
    'k3jyouuj': {
      'en': 'Total Sales',
      'fr': '',
    },
    '1fmuxw6c': {
      'en': 'Profit Margins',
      'fr': '',
    },
    '339wf7ce': {
      'en': 'Production Cost / Chicken',
      'fr': '',
    },
    'i0rg2ncb': {
      'en': 'Starter',
      'fr': '',
    },
    'ohgapdy5': {
      'en': 'MC Starter',
      'fr': '',
    },
    'tyv9rj5z': {
      'en': 'Total Used',
      'fr': '',
    },
    '3zxu33km': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'lj0szgwj': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'bb3f30eb': {
      'en': 'Feed Components',
      'fr': '',
    },
    'ccceff5x': {
      'en': 'Poultry Project Needs for making Broiler Starter.',
      'fr': '',
    },
    'n8dk4cc1': {
      'en': 'Update Feed Cost',
      'fr': '',
    },
    'a4hng387': {
      'en': 'Feed',
      'fr': '',
    },
    '6kjgebn9': {
      'en': 'Qty (Kgs)',
      'fr': '',
    },
    'omu5g3bj': {
      'en': 'MC Starter',
      'fr': '',
    },
    'h8dzcysj': {
      'en': 'MAIZE',
      'fr': '',
    },
    '0lgbvzvm': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'b3pz20jx': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'cm3q7sum': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'n5xgutvf': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'yi274emx': {
      'en': 'LIME',
      'fr': '',
    },
    'liy4hog1': {
      'en': 'SALT',
      'fr': '',
    },
    'woliycf8': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'czpe4hpg': {
      'en': 'BROILER VIT',
      'fr': '',
    },
    'z61t32k3': {
      'en': 'CONCENTRATES',
      'fr': '',
    },
    'ilbse6er': {
      'en': 'Grower',
      'fr': '',
    },
    'ahhep8tl': {
      'en': 'MC Grower',
      'fr': '',
    },
    'uxgd6phk': {
      'en': 'Total Used',
      'fr': '',
    },
    '7310p3w3': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'ax6zbmfy': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    '75l56qul': {
      'en': 'Feed Components',
      'fr': '',
    },
    'e3fjijlz': {
      'en': 'Poultry Project Needs for making Broiler Grower.',
      'fr': '',
    },
    'b3iq5hor': {
      'en': 'Update Feed Cost',
      'fr': '',
    },
    'oialljxo': {
      'en': 'Feed',
      'fr': '',
    },
    '8th73f6r': {
      'en': 'Qty (Kgs)',
      'fr': '',
    },
    'khb07q9k': {
      'en': 'MC Grower',
      'fr': '',
    },
    'tg3kirmp': {
      'en': 'MAIZE',
      'fr': '',
    },
    'afodos4i': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'txu7a966': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    '46u2d0r0': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'tzyrt7ug': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'nogiqrd4': {
      'en': 'LIME',
      'fr': '',
    },
    'mjjtbaif': {
      'en': 'SALT',
      'fr': '',
    },
    'vq117t8i': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'jl5zvc3z': {
      'en': 'BROILER VIT',
      'fr': '',
    },
    'irsfhqgm': {
      'en': 'CONCENTRATES',
      'fr': '',
    },
    'hgu9xrsj': {
      'en': 'Finisher',
      'fr': '',
    },
    'hmsoqs2x': {
      'en': 'MC Finisher',
      'fr': '',
    },
    'l43lz97y': {
      'en': 'Total Used',
      'fr': '',
    },
    'bgi8mus2': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    '9j99whhy': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    '2km6sp81': {
      'en': 'Feed Components',
      'fr': '',
    },
    '0itzj81b': {
      'en': 'Poultry Project Needs for making Broiler Finisher.',
      'fr': '',
    },
    'ww5ywt3r': {
      'en': 'Update Feed Cost',
      'fr': '',
    },
    'bx2sldoa': {
      'en': 'Feed',
      'fr': '',
    },
    'ix7ykdsj': {
      'en': 'Qty (Kgs)',
      'fr': '',
    },
    '2yjfplr2': {
      'en': 'MC Finisher',
      'fr': '',
    },
    'vmj7oqrh': {
      'en': 'MAIZE',
      'fr': '',
    },
    'ehp2qwf6': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'va3qzlus': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'izw3zzyn': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    '0456n6z5': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'wg6a1pq4': {
      'en': 'LIME',
      'fr': '',
    },
    'xw0jzy6x': {
      'en': 'SALT',
      'fr': '',
    },
    'asbrt9n6': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'f6a26qq0': {
      'en': 'BROILER VIT',
      'fr': '',
    },
    'bj0ut2us': {
      'en': 'CONCENTRATES',
      'fr': '',
    },
    'uuzk1cio': {
      'en': 'Feed',
      'fr': '',
    },
    '7gh4wemn': {
      'en': 'Units',
      'fr': '',
    },
    '14jlwlm6': {
      'en': 'MAIZE',
      'fr': '',
    },
    'w8cottae': {
      'en': 'Mc Ratio',
      'fr': '',
    },
    'pupyl7q8': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    '8ongqefs': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'fxwoh13r': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'hximrrlz': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'jlejriuq': {
      'en': 'LIME',
      'fr': '',
    },
    'rik0ws5i': {
      'en': 'SALT',
      'fr': '',
    },
    'tuw8qo0m': {
      'en': 'METHIONINE',
      'fr': '',
    },
    '89zhq5sn': {
      'en': 'BROILER VIT',
      'fr': '',
    },
    'pghn2sxn': {
      'en': 'CONCENTRATES',
      'fr': '',
    },
    'kofb2p46': {
      'en': 'Your Account',
      'fr': '',
    },
    '5ukmg46n': {
      'en': 'Edit Profile',
      'fr': '',
    },
    'hfj6tzvj': {
      'en': 'Subscription Plan',
      'fr': '',
    },
    'cbh6641e': {
      'en': 'App Navigation',
      'fr': '',
    },
    'zp8coan6': {
      'en': 'Settings',
      'fr': '',
    },
    'eodwal56': {
      'en': 'Number of Chickens',
      'fr': '',
    },
    'yf033ens': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Profile
  {
    'yv1035cp': {
      'en': 'Switch to Light Mode',
      'fr': '',
    },
    'tz8nvqdg': {
      'en': 'Switch to Light Mode',
      'fr': '',
    },
    '5n6hrlto': {
      'en': 'Edit Profile',
      'fr': '',
    },
    'ypfourzv': {
      'en': 'Change Password',
      'fr': '',
    },
    'oqq100sx': {
      'en': 'Invite Friends',
      'fr': '',
    },
    'axrtngnh': {
      'en': 'Log Out',
      'fr': '',
    },
    'c0vgoe3j': {
      'en': '__',
      'fr': '',
    },
  },
  // ForgetPassword
  {
    'oqc200od': {
      'en': 'Forgot Password',
      'fr': '',
    },
    '3kne0mnq': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'fr': '',
    },
    'ibffowrf': {
      'en': 'Your email address...',
      'fr': '',
    },
    '9vbh6xrz': {
      'en': 'Enter your email...',
      'fr': '',
    },
    'uirx6k8y': {
      'en': 'Send Link',
      'fr': '',
    },
    'vwhexmw2': {
      'en': 'Back',
      'fr': '',
    },
    'fh6bzp3z': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Pricing
  {
    'uhw3mej8': {
      'en': 'Your Pricing',
      'fr': '',
    },
    'xab68r2w': {
      'en': 'Please fill in the amount price below to continue.',
      'fr': '',
    },
    'b10ikrzz': {
      'en': 'Information Data',
      'fr': '',
    },
    'sxt9zk3z': {
      'en': 'RWF',
      'fr': '',
    },
    'hrx5xyoq': {
      'en': 'EUR',
      'fr': '',
    },
    '709ma5fa': {
      'en': 'KSH',
      'fr': '',
    },
    'ab0vfw0z': {
      'en': 'Select the Currency*',
      'fr': '',
    },
    'cf0ahhfs': {
      'en': 'Search for currency...',
      'fr': '',
    },
    '13qe8rbj': {
      'en': 'Currency',
      'fr': '',
    },
    '6ep2ivak': {
      'en': 'Number of Chickens*',
      'fr': '',
    },
    '47xgz4u7': {
      'en': 'Day Old Chick price*',
      'fr': '',
    },
    'p0er9t5x': {
      'en': 'Grown Broilers  per chicken*',
      'fr': '',
    },
    'qzly0in7': {
      'en': 'Next',
      'fr': '',
    },
    'rl69t9ir': {
      'en': 'Field is required',
      'fr': '',
    },
    'vyur6mh5': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'xf1qfq0a': {
      'en': 'Field is required',
      'fr': '',
    },
    'wndnood4': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'zln2e12l': {
      'en': 'Field is required',
      'fr': '',
    },
    '8y2s87bs': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '9mzr2jjw': {
      'en': 'Investment Information',
      'fr': '',
    },
    's11m4no4': {
      'en': 'Poultry houses per square meter*',
      'fr': '',
    },
    '9gsggqw4': {
      'en': 'Drinker Price*',
      'fr': '',
    },
    'l55j1zew': {
      'en': 'Feeder Price*',
      'fr': '',
    },
    'f6gae1qc': {
      'en': 'Brooder Price*',
      'fr': '',
    },
    'c191mrcc': {
      'en': 'Infrared Lamp Price*',
      'fr': '',
    },
    '0il5j4dr': {
      'en': 'Borehole Price*',
      'fr': '',
    },
    'dlkz4uz2': {
      'en': 'Set of Tools Price per set*',
      'fr': '',
    },
    'kgnegynh': {
      'en': 'Back',
      'fr': '',
    },
    '8uc4wr8a': {
      'en': 'Next',
      'fr': '',
    },
    '16dpa6k7': {
      'en': 'Field is required',
      'fr': '',
    },
    'zs8g9cjy': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    's0oct2ou': {
      'en': 'Field is required',
      'fr': '',
    },
    'c44eia6a': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'dfqzom7a': {
      'en': 'Field is required',
      'fr': '',
    },
    'ai3aqv7b': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'evu8j8ld': {
      'en': 'Field is required',
      'fr': '',
    },
    'sbzwy7tz': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'ouogdmwj': {
      'en': 'Field is required',
      'fr': '',
    },
    'sfa9hky1': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '5yvy3w38': {
      'en': 'Field is required',
      'fr': '',
    },
    'a9q4qx1z': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'sht7ac74': {
      'en': 'Field is required',
      'fr': '',
    },
    'xdtqespm': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '62sb9vzz': {
      'en': 'Consumables Information',
      'fr': '',
    },
    'nfi76trj': {
      'en': 'Vaccines and other Medications per Kg*',
      'fr': '',
    },
    'avk87m0u': {
      'en': 'Selling Cost per Chicken*',
      'fr': '',
    },
    '4kqqan55': {
      'en': 'Transport per Chicken*',
      'fr': '',
    },
    '0dj01za1': {
      'en': 'Feeds Kgs per 50Kg Bag*',
      'fr': '',
    },
    'j1scxuiu': {
      'en': 'Water per Liter*',
      'fr': '',
    },
    '13goy1cu': {
      'en': 'Daily Power Consumption per Chicken*',
      'fr': '',
    },
    '7omhhpk1': {
      'en': 'Litter per Chicken*',
      'fr': '',
    },
    '4um0b3y7': {
      'en': 'Labour per Chicken*',
      'fr': '',
    },
    'rkjnwh36': {
      'en': 'Back',
      'fr': '',
    },
    'hrn6z93b': {
      'en': 'Next',
      'fr': '',
    },
    '7z7e3yjz': {
      'en': 'Field is required',
      'fr': '',
    },
    'skw1fpi8': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'g9chvi9w': {
      'en': 'Field is required',
      'fr': '',
    },
    'lutck2tx': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'bj0ne6jo': {
      'en': 'Field is required',
      'fr': '',
    },
    'mjygu7w6': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '6ah5gjq5': {
      'en': 'Field is required',
      'fr': '',
    },
    '97kjl6df': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'mwuki7lq': {
      'en': 'Field is required',
      'fr': '',
    },
    'mm5zujrs': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'yac4rbvs': {
      'en': 'Field is required',
      'fr': '',
    },
    'l5jft4u8': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '1eg59ozi': {
      'en': 'Field is required',
      'fr': '',
    },
    '35rwk8xx': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    't9onmg4o': {
      'en': 'Field is required',
      'fr': '',
    },
    'azvej3ts': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '50qqct86': {
      'en': 'Feed Information',
      'fr': '',
    },
    'z07ez091': {
      'en': 'Maize per 50Kg Bag*',
      'fr': '',
    },
    'xkt7nlak': {
      'en': 'Full Fat Soya per 50Kg Bag*',
      'fr': '',
    },
    't7p720xi': {
      'en': 'Low Fat Soya per 50Kg Bag*',
      'fr': '',
    },
    't0hrv117': {
      'en': 'Fish Meal per 50Kg Bag*',
      'fr': '',
    },
    '1uhy8n43': {
      'en': 'Dicalcium Phosphate per 50Kg Bag*',
      'fr': '',
    },
    'rybxtvnp': {
      'en': 'Lime per 50Kg Bag*',
      'fr': '',
    },
    'twy0tkoq': {
      'en': 'Salt per 25Kg Bag*',
      'fr': '',
    },
    'pwjr0ymq': {
      'en': 'Methionine per 1Kg Pack*',
      'fr': '',
    },
    'qopolht8': {
      'en': 'BROILER VIT  per 1Kg Pack*',
      'fr': '',
    },
    '3sae63aq': {
      'en': 'Concentrates per 50Kg Bag*',
      'fr': '',
    },
    'ov7wro7m': {
      'en': 'Back',
      'fr': '',
    },
    'x6omd7aa': {
      'en': 'Done',
      'fr': '',
    },
    'x4zfcabi': {
      'en': 'Field is required',
      'fr': '',
    },
    '7e5jlimv': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '7gf8z0gr': {
      'en': 'Field is required',
      'fr': '',
    },
    'ov67hwnx': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'w4xo1kdq': {
      'en': 'Field is required',
      'fr': '',
    },
    'epph2kb3': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '7sdxuk2g': {
      'en': 'Field is required',
      'fr': '',
    },
    'uudy3h37': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'qi8foxkn': {
      'en': 'Field is required',
      'fr': '',
    },
    'gb219t5t': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'w30bmuy2': {
      'en': 'Field is required',
      'fr': '',
    },
    'jv9qrcbx': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '1ivdxln9': {
      'en': 'Field is required',
      'fr': '',
    },
    '5axb1wy9': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '2uxpghq6': {
      'en': 'Field is required',
      'fr': '',
    },
    'rcbva5g9': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'omhiu19b': {
      'en': 'Field is required',
      'fr': '',
    },
    'g8pfemzg': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'qmteavrn': {
      'en': 'Field is required',
      'fr': '',
    },
    '7nbjokox': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'fdrn7iey': {
      'en': 'Home',
      'fr': '',
    },
  },
  // subscription
  {
    'zoj28lz8': {
      'en': 'Subscription / Payment',
      'fr': '',
    },
    'vru27iae': {
      'en': 'Your Subscription',
      'fr': '',
    },
    'o9uwvoln': {
      'en': 'Monthly',
      'fr': '',
    },
    'rdb342r7': {
      'en': '\$15.99/mo',
      'fr': '',
    },
    'noouxldw': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'fr': '',
    },
    'kqx1z72c': {
      'en': 'Other Offers',
      'fr': '',
    },
    '7kliuk1u': {
      'en': 'Annual (save \$12)',
      'fr': '',
    },
    'ruolh8oc': {
      'en': '\$180/yr',
      'fr': '',
    },
    'kgvywfee': {
      'en': 'Gain unlimited access to all the content we have to offer! ',
      'fr': '',
    },
    'lneev0fl': {
      'en': 'Free Limited Access',
      'fr': '',
    },
    '6fshr40p': {
      'en':
          'Continue with limited access at no cost. Browse blogs and videos aimed to help you in your journey!',
      'fr': '',
    },
    'jrr9hbxo': {
      'en': 'Change Plan',
      'fr': '',
    },
    'r44jsuxv': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Overview
  {
    'li6kdunz': {
      'en': 'Your Account',
      'fr': '',
    },
    'bgvzg1wu': {
      'en': 'Edit Profile',
      'fr': '',
    },
    'kkmidd61': {
      'en': 'Subscription Plan',
      'fr': '',
    },
    'k73lho7o': {
      'en': 'App Navigation',
      'fr': '',
    },
    '96fzag1o': {
      'en': 'Settings',
      'fr': '',
    },
    'uwo0gdw6': {
      'en': 'Home',
      'fr': '',
    },
    'vnw7zd5t': {
      'en': 'Overview',
      'fr': '',
    },
    '7cm8iz55': {
      'en': 'Feed Mixer',
      'fr': '',
    },
    '1lxx57bo': {
      'en': 'Platform Navigation',
      'fr': '',
    },
    'pmksxiar': {
      'en': 'Starter',
      'fr': '',
    },
    'nly4cto0': {
      'en': 'Grower',
      'fr': '',
    },
    'uxobbh5q': {
      'en': 'Finisher',
      'fr': '',
    },
    's7vy7sug': {
      'en': 'Quick Math',
      'fr': '',
    },
    'fxufilrj': {
      'en': 'Chickens',
      'fr': '',
    },
    'tegxul5s': {
      'en': 'DASHBOARD',
      'fr': '',
    },
    '2gmtb39g': {
      'en': 'Below is a farm overview',
      'fr': '',
    },
    '4x1y8tuv': {
      'en': 'Buy',
      'fr': '',
    },
    'gf3c3qrx': {
      'en': 'Capital  Investment',
      'fr': '',
    },
    '8gvhnqzn': {
      'en': 'Running Costs',
      'fr': '',
    },
    'ey32m6ds': {
      'en': 'Production Cost',
      'fr': '',
    },
    'm4tsyxdb': {
      'en': 'Total Sales',
      'fr': '',
    },
    'zwmobeo6': {
      'en': 'Profit Margins',
      'fr': '',
    },
    'jd1sxo9y': {
      'en': 'Production Cost / Chicken',
      'fr': '',
    },
    'j6xgl3mm': {
      'en': 'MC Starter',
      'fr': '',
    },
    '15c5r8j7': {
      'en': 'Total Used',
      'fr': '',
    },
    'knr1rrro': {
      'en': '562k',
      'fr': '',
    },
    'vcff7y9d': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'kflis76b': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'falt7973': {
      'en': 'MC Grower',
      'fr': '',
    },
    '3gx64zpa': {
      'en': 'Total Used',
      'fr': '',
    },
    'q0wqyakt': {
      'en': '562k',
      'fr': '',
    },
    'nd4fqrd0': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    '6s3k17b5': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'l757lhbs': {
      'en': 'MC Finisher',
      'fr': '',
    },
    'uz9nilku': {
      'en': 'Total Used',
      'fr': '',
    },
    '81ezrbpi': {
      'en': '562k',
      'fr': '',
    },
    'tjyjexvg': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    '6gpy0f23': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'sx5o2pvh': {
      'en': 'Feed Components',
      'fr': '',
    },
    'o6d8di93': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    'bly3u42t': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    '0b7tldch': {
      'en': 'Feed',
      'fr': '',
    },
    '8juj8fs4': {
      'en': 'Component  (%)',
      'fr': '',
    },
    'mxe6rch1': {
      'en': 'Amount',
      'fr': '',
    },
    'rv4mcqrz': {
      'en': 'Index',
      'fr': '',
    },
    'k0358yfz': {
      'en': 'Total',
      'fr': '',
    },
    'arkla4ti': {
      'en': 'MAIZE',
      'fr': '',
    },
    '12yq2ian': {
      'en': 'Feed',
      'fr': '',
    },
    'c5pm017l': {
      'en': '0.1',
      'fr': '',
    },
    '4n08ftnf': {
      'en': '\$2,100',
      'fr': '',
    },
    'rjkfa8sh': {
      'en': '300',
      'fr': '',
    },
    'j773tm81': {
      'en': '1000',
      'fr': '',
    },
    '2wr4vly0': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    '58m7jcar': {
      'en': 'Feed',
      'fr': '',
    },
    '650fe7t7': {
      'en': '0.1',
      'fr': '',
    },
    'dyowckuh': {
      'en': '\$2,100',
      'fr': '',
    },
    'gjl7kgt3': {
      'en': '300',
      'fr': '',
    },
    '3yzdqh8y': {
      'en': '1000',
      'fr': '',
    },
    'mgx749f2': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    '7d6lj2jz': {
      'en': 'Feed',
      'fr': '',
    },
    'hpggbexe': {
      'en': '0.1',
      'fr': '',
    },
    'r6g402vg': {
      'en': '\$2,100',
      'fr': '',
    },
    '5ejt13e8': {
      'en': '300',
      'fr': '',
    },
    'jez9p2y3': {
      'en': '1000',
      'fr': '',
    },
    'n19zs42b': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'zsq5a1oy': {
      'en': 'Feed',
      'fr': '',
    },
    'fm22sgou': {
      'en': '0.1',
      'fr': '',
    },
    '7o75f8x6': {
      'en': '\$2,100',
      'fr': '',
    },
    'zn8hoas1': {
      'en': '300',
      'fr': '',
    },
    'uikxu84l': {
      'en': '1000',
      'fr': '',
    },
    'q5oivf2f': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'rnyxmvgk': {
      'en': 'Feed',
      'fr': '',
    },
    'hzc0mmwf': {
      'en': '0.1',
      'fr': '',
    },
    '619pnrig': {
      'en': '\$2,100',
      'fr': '',
    },
    'yls9ioqe': {
      'en': '300',
      'fr': '',
    },
    'sy0n8h0r': {
      'en': '1000',
      'fr': '',
    },
    '14bqqqpz': {
      'en': 'LIME',
      'fr': '',
    },
    'tsj4nfze': {
      'en': 'Feed',
      'fr': '',
    },
    'gfcoym6f': {
      'en': '0.1',
      'fr': '',
    },
    '6xkvjbqp': {
      'en': '\$2,100',
      'fr': '',
    },
    'jj062gtm': {
      'en': '300',
      'fr': '',
    },
    '7gd3auud': {
      'en': '1000',
      'fr': '',
    },
    'ytuxxyov': {
      'en': 'SALT',
      'fr': '',
    },
    'd0nb900l': {
      'en': 'Feed',
      'fr': '',
    },
    'xh0rk7p9': {
      'en': '0.1',
      'fr': '',
    },
    '5iujjexc': {
      'en': '\$2,100',
      'fr': '',
    },
    '74711vqt': {
      'en': '300',
      'fr': '',
    },
    'ru9ih473': {
      'en': '1000',
      'fr': '',
    },
    'n8g79q4q': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'ojm4jx3l': {
      'en': 'Feed',
      'fr': '',
    },
    'dj3ylpr3': {
      'en': '0.1',
      'fr': '',
    },
    'by0f3zkw': {
      'en': '\$2,100',
      'fr': '',
    },
    '1ebhfxfk': {
      'en': '300',
      'fr': '',
    },
    'mj0geu0o': {
      'en': '1000',
      'fr': '',
    },
    'wut09vus': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    '5s1de39z': {
      'en': 'Feed',
      'fr': '',
    },
    '29epqfm6': {
      'en': '0.1',
      'fr': '',
    },
    '9wrvcv1i': {
      'en': '\$2,100',
      'fr': '',
    },
    'z4vm6yhk': {
      'en': '300',
      'fr': '',
    },
    '1nmhwqay': {
      'en': '1000',
      'fr': '',
    },
    '2rpv32dj': {
      'en': 'Feed Components',
      'fr': '',
    },
    '9xr7oxbu': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    '6fglc67g': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    'unntp8yz': {
      'en': 'Feed',
      'fr': '',
    },
    '3nqlgr1q': {
      'en': 'Component  (%)',
      'fr': '',
    },
    'y7uegu5s': {
      'en': 'Amount',
      'fr': '',
    },
    'sll9s6d3': {
      'en': 'Index',
      'fr': '',
    },
    '1hodsjor': {
      'en': 'Total',
      'fr': '',
    },
    'mho6qbmo': {
      'en': 'MAIZE',
      'fr': '',
    },
    '74j3tzjn': {
      'en': 'Feed',
      'fr': '',
    },
    'lnhbxs2j': {
      'en': '0.1',
      'fr': '',
    },
    'iwf4dxwr': {
      'en': '\$2,100',
      'fr': '',
    },
    '8bjzt2ts': {
      'en': '300',
      'fr': '',
    },
    'gzjpqi57': {
      'en': '1000',
      'fr': '',
    },
    'halrtc5w': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'iedw66io': {
      'en': 'Feed',
      'fr': '',
    },
    '1lzxlro2': {
      'en': '0.1',
      'fr': '',
    },
    '7s4c0w0s': {
      'en': '\$2,100',
      'fr': '',
    },
    '0lucalqg': {
      'en': '300',
      'fr': '',
    },
    'g2ib6ag3': {
      'en': '1000',
      'fr': '',
    },
    'anlp9g4n': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    '7c2czr1d': {
      'en': 'Feed',
      'fr': '',
    },
    'ljrv3d2x': {
      'en': '0.1',
      'fr': '',
    },
    '58duahcb': {
      'en': '\$2,100',
      'fr': '',
    },
    '35feg1w8': {
      'en': '300',
      'fr': '',
    },
    '9h9o9ku6': {
      'en': '1000',
      'fr': '',
    },
    'r0s82w4f': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'tqdn2x56': {
      'en': 'Feed',
      'fr': '',
    },
    'e2a0voc1': {
      'en': '0.1',
      'fr': '',
    },
    'jxs84j5x': {
      'en': '\$2,100',
      'fr': '',
    },
    'k3youka8': {
      'en': '300',
      'fr': '',
    },
    'dvnxhlo9': {
      'en': '1000',
      'fr': '',
    },
    'rykyec82': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'nhqhbs4f': {
      'en': 'Feed',
      'fr': '',
    },
    'ib8q7uwq': {
      'en': '0.1',
      'fr': '',
    },
    'tuzyou6l': {
      'en': '\$2,100',
      'fr': '',
    },
    '6s9kxbuv': {
      'en': '300',
      'fr': '',
    },
    'pqwm9scx': {
      'en': '1000',
      'fr': '',
    },
    'vmwkagxz': {
      'en': 'LIME',
      'fr': '',
    },
    '7j7murzq': {
      'en': 'Feed',
      'fr': '',
    },
    'xp2etjag': {
      'en': '0.1',
      'fr': '',
    },
    'opj6mgem': {
      'en': '\$2,100',
      'fr': '',
    },
    'ababw255': {
      'en': '300',
      'fr': '',
    },
    'gxl8vktu': {
      'en': '1000',
      'fr': '',
    },
    'i86vnk5v': {
      'en': 'SALT',
      'fr': '',
    },
    'fgx7h88x': {
      'en': 'Feed',
      'fr': '',
    },
    '48y498i8': {
      'en': '0.1',
      'fr': '',
    },
    'g74nho6o': {
      'en': '\$2,100',
      'fr': '',
    },
    '6kj8lnf4': {
      'en': '300',
      'fr': '',
    },
    'kpq63xbn': {
      'en': '1000',
      'fr': '',
    },
    'uxgmu6um': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'lth6m4dw': {
      'en': 'Feed',
      'fr': '',
    },
    'xjzk7qtq': {
      'en': '0.1',
      'fr': '',
    },
    '58kw5fd4': {
      'en': '\$2,100',
      'fr': '',
    },
    '9g007487': {
      'en': '300',
      'fr': '',
    },
    'sopbtmsp': {
      'en': '1000',
      'fr': '',
    },
    'ect6mj5z': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    'arzyutr2': {
      'en': 'Feed',
      'fr': '',
    },
    '6bkugqwt': {
      'en': '0.1',
      'fr': '',
    },
    'er7fdwny': {
      'en': '\$2,100',
      'fr': '',
    },
    '6t4y9kec': {
      'en': '300',
      'fr': '',
    },
    '0bbnmwwq': {
      'en': '1000',
      'fr': '',
    },
    '7hmgb4ns': {
      'en': 'Feed Components',
      'fr': '',
    },
    '47j1b29j': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    '5yvzxaqd': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    'vwb2b8r9': {
      'en': 'Feed',
      'fr': '',
    },
    '46avz0k7': {
      'en': 'Component  (%)',
      'fr': '',
    },
    'w30rlv2l': {
      'en': 'Amount',
      'fr': '',
    },
    'qlqmay39': {
      'en': 'Index',
      'fr': '',
    },
    'lrhxkg66': {
      'en': 'Total',
      'fr': '',
    },
    'wby8ekrx': {
      'en': 'MAIZE',
      'fr': '',
    },
    'ertu6qo2': {
      'en': 'Feed',
      'fr': '',
    },
    'qw6a9hvt': {
      'en': '0.1',
      'fr': '',
    },
    '03tai5l5': {
      'en': '\$2,100',
      'fr': '',
    },
    'zyiaklyk': {
      'en': '300',
      'fr': '',
    },
    'zk8wmagq': {
      'en': '1000',
      'fr': '',
    },
    '415fpmy9': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'rbhtno8i': {
      'en': 'Feed',
      'fr': '',
    },
    'al740w4m': {
      'en': '0.1',
      'fr': '',
    },
    'bfjoiij6': {
      'en': '\$2,100',
      'fr': '',
    },
    'ozgjuip9': {
      'en': '300',
      'fr': '',
    },
    'vru2iytm': {
      'en': '1000',
      'fr': '',
    },
    '7woyyj79': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'hiplb1ms': {
      'en': 'Feed',
      'fr': '',
    },
    'r7hxkugs': {
      'en': '0.1',
      'fr': '',
    },
    'crqhwtez': {
      'en': '\$2,100',
      'fr': '',
    },
    'anoa8x9u': {
      'en': '300',
      'fr': '',
    },
    'vnzglpt9': {
      'en': '1000',
      'fr': '',
    },
    'vow93ach': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'p6tyz42s': {
      'en': 'Feed',
      'fr': '',
    },
    'metzmyap': {
      'en': '0.1',
      'fr': '',
    },
    'ps4uubvn': {
      'en': '\$2,100',
      'fr': '',
    },
    'qzgzdlz5': {
      'en': '300',
      'fr': '',
    },
    'xflu5scy': {
      'en': '1000',
      'fr': '',
    },
    '2vevsm93': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'sa65odsl': {
      'en': 'Feed',
      'fr': '',
    },
    'd59bd3ln': {
      'en': '0.1',
      'fr': '',
    },
    '9vjr4j53': {
      'en': '\$2,100',
      'fr': '',
    },
    'valvqqee': {
      'en': '300',
      'fr': '',
    },
    'awc2lnx3': {
      'en': '1000',
      'fr': '',
    },
    '4z35xbob': {
      'en': 'LIME',
      'fr': '',
    },
    '0ntwkory': {
      'en': 'Feed',
      'fr': '',
    },
    '4eujvqut': {
      'en': '0.1',
      'fr': '',
    },
    'wachg78q': {
      'en': '\$2,100',
      'fr': '',
    },
    'vzk6uhoj': {
      'en': '300',
      'fr': '',
    },
    'q12vgefv': {
      'en': '1000',
      'fr': '',
    },
    'yklfufob': {
      'en': 'SALT',
      'fr': '',
    },
    'bb9gibmg': {
      'en': 'Feed',
      'fr': '',
    },
    '45dx0161': {
      'en': '0.1',
      'fr': '',
    },
    '8ouzbypy': {
      'en': '\$2,100',
      'fr': '',
    },
    'cnxkvt3n': {
      'en': '300',
      'fr': '',
    },
    'jmhjbhpl': {
      'en': '1000',
      'fr': '',
    },
    'k8uhcvfv': {
      'en': 'METHIONINE',
      'fr': '',
    },
    '8sjaw11i': {
      'en': 'Feed',
      'fr': '',
    },
    'akqexorr': {
      'en': '0.1',
      'fr': '',
    },
    '7oatnu1u': {
      'en': '\$2,100',
      'fr': '',
    },
    'gr3km20k': {
      'en': '300',
      'fr': '',
    },
    'jea2erwf': {
      'en': '1000',
      'fr': '',
    },
    '4w50iee7': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    '2wy2bcvt': {
      'en': 'Feed',
      'fr': '',
    },
    'bdjwm4o9': {
      'en': '0.1',
      'fr': '',
    },
    'dzl2138d': {
      'en': '\$2,100',
      'fr': '',
    },
    '5roy04yo': {
      'en': '300',
      'fr': '',
    },
    '6iz4nqjt': {
      'en': '1000',
      'fr': '',
    },
    '3ko7xq8m': {
      'en': 'Make',
      'fr': '',
    },
    'zgosuhcw': {
      'en': 'Capital  Investment',
      'fr': '',
    },
    'volc9ef9': {
      'en': 'Running Costs',
      'fr': '',
    },
    'f3nb1cw0': {
      'en': 'Production Cost',
      'fr': '',
    },
    '1fg51w3c': {
      'en': 'Total Sales',
      'fr': '',
    },
    'g4du0jgx': {
      'en': 'Profit Margins',
      'fr': '',
    },
    'dethetmb': {
      'en': 'Production Cost / Chicken',
      'fr': '',
    },
    '4try4zan': {
      'en': 'MC Starter',
      'fr': '',
    },
    'hzuefbeo': {
      'en': 'Total Used',
      'fr': '',
    },
    'pc227370': {
      'en': '562k',
      'fr': '',
    },
    'bn7v2mpg': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'u4dpm92q': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'iiaeebhg': {
      'en': 'MC Grower',
      'fr': '',
    },
    'swhkxsy7': {
      'en': 'Total Used',
      'fr': '',
    },
    'lvk4mlp7': {
      'en': '562k',
      'fr': '',
    },
    '7tzwhimw': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'r5o5rjj2': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'veojnbvv': {
      'en': 'MC Finisher',
      'fr': '',
    },
    'rr1xrey6': {
      'en': 'Total Used',
      'fr': '',
    },
    '3br5sgoa': {
      'en': '562k',
      'fr': '',
    },
    'eitt2kdh': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'ob7u3509': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'hoejrswv': {
      'en': 'Feed Components',
      'fr': '',
    },
    '0mw8q70j': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    'z581absg': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    'euag7c8i': {
      'en': 'Feed',
      'fr': '',
    },
    '3eoakyf6': {
      'en': 'Component  (%)',
      'fr': '',
    },
    '88b7tdxk': {
      'en': 'Amount',
      'fr': '',
    },
    'mjt91fkl': {
      'en': 'Index',
      'fr': '',
    },
    'zkcfnjbu': {
      'en': 'Total',
      'fr': '',
    },
    'ssazj8nw': {
      'en': 'MAIZE',
      'fr': '',
    },
    '8np4hofy': {
      'en': 'Feed',
      'fr': '',
    },
    'apx8ymxx': {
      'en': '0.1',
      'fr': '',
    },
    'ps4tuolp': {
      'en': '\$2,100',
      'fr': '',
    },
    '4svgke5p': {
      'en': '300',
      'fr': '',
    },
    '7kmjel24': {
      'en': '1000',
      'fr': '',
    },
    '4kdnk97g': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'hgti99pb': {
      'en': 'Feed',
      'fr': '',
    },
    'cqey5oso': {
      'en': '0.1',
      'fr': '',
    },
    'zshc1h11': {
      'en': '\$2,100',
      'fr': '',
    },
    'dd0r6b1u': {
      'en': '300',
      'fr': '',
    },
    'g35k3qkx': {
      'en': '1000',
      'fr': '',
    },
    '649c3low': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    '1ljh0x8y': {
      'en': 'Feed',
      'fr': '',
    },
    'uu2ld3hg': {
      'en': '0.1',
      'fr': '',
    },
    'z76kssap': {
      'en': '\$2,100',
      'fr': '',
    },
    '7mu2g3cm': {
      'en': '300',
      'fr': '',
    },
    '1dc3ah1g': {
      'en': '1000',
      'fr': '',
    },
    'dny28zxm': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'y7ixiv9q': {
      'en': 'Feed',
      'fr': '',
    },
    'yc6mtbu9': {
      'en': '0.1',
      'fr': '',
    },
    'usuxrhoq': {
      'en': '\$2,100',
      'fr': '',
    },
    'amxgf11d': {
      'en': '300',
      'fr': '',
    },
    'mmuwz9eo': {
      'en': '1000',
      'fr': '',
    },
    'rc77tnai': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    '1jmvr738': {
      'en': 'Feed',
      'fr': '',
    },
    'ujsn4o7z': {
      'en': '0.1',
      'fr': '',
    },
    'qtj0nmuj': {
      'en': '\$2,100',
      'fr': '',
    },
    'i4ik8m10': {
      'en': '300',
      'fr': '',
    },
    'kn2c2uzz': {
      'en': '1000',
      'fr': '',
    },
    'gl5ad5qa': {
      'en': 'LIME',
      'fr': '',
    },
    'ev3ri0ua': {
      'en': 'Feed',
      'fr': '',
    },
    '3smctddv': {
      'en': '0.1',
      'fr': '',
    },
    'lh4bxm0n': {
      'en': '\$2,100',
      'fr': '',
    },
    '5zmdxj56': {
      'en': '300',
      'fr': '',
    },
    'gyft08re': {
      'en': '1000',
      'fr': '',
    },
    'eplrtcbj': {
      'en': 'SALT',
      'fr': '',
    },
    'rztfq039': {
      'en': 'Feed',
      'fr': '',
    },
    '7ccr2zgc': {
      'en': '0.1',
      'fr': '',
    },
    'um32h3xh': {
      'en': '\$2,100',
      'fr': '',
    },
    'oqc0bw0y': {
      'en': '300',
      'fr': '',
    },
    'uo8uc4id': {
      'en': '1000',
      'fr': '',
    },
    'i1724z9l': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'beuax9y6': {
      'en': 'Feed',
      'fr': '',
    },
    'pg8da6vy': {
      'en': '0.1',
      'fr': '',
    },
    'cvy81lni': {
      'en': '\$2,100',
      'fr': '',
    },
    'wxm01zox': {
      'en': '300',
      'fr': '',
    },
    'bvuedq76': {
      'en': '1000',
      'fr': '',
    },
    '9hcz2yt1': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    'sglcms8n': {
      'en': 'Feed',
      'fr': '',
    },
    'xze61twk': {
      'en': '0.1',
      'fr': '',
    },
    'y81u0xol': {
      'en': '\$2,100',
      'fr': '',
    },
    'vsifz2ig': {
      'en': '300',
      'fr': '',
    },
    'qj110mx1': {
      'en': '1000',
      'fr': '',
    },
    'lhx5raxy': {
      'en': 'Feed Components',
      'fr': '',
    },
    'zayyoh31': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    'r03tscla': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    'mt4jyulp': {
      'en': 'Feed',
      'fr': '',
    },
    'yk716yy9': {
      'en': 'Component  (%)',
      'fr': '',
    },
    's76j8kvg': {
      'en': 'Amount',
      'fr': '',
    },
    'cqmggy10': {
      'en': 'Index',
      'fr': '',
    },
    'l8rsa9lf': {
      'en': 'Total',
      'fr': '',
    },
    'd0etgb3m': {
      'en': 'MAIZE',
      'fr': '',
    },
    'kffqp9t7': {
      'en': 'Feed',
      'fr': '',
    },
    '3ozhugfo': {
      'en': '0.1',
      'fr': '',
    },
    'qpstzx49': {
      'en': '\$2,100',
      'fr': '',
    },
    '4klrpwn9': {
      'en': '300',
      'fr': '',
    },
    'v2itakm1': {
      'en': '1000',
      'fr': '',
    },
    'x07bsrcw': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'bse3njny': {
      'en': 'Feed',
      'fr': '',
    },
    'lqkbwlo5': {
      'en': '0.1',
      'fr': '',
    },
    's6ti4q69': {
      'en': '\$2,100',
      'fr': '',
    },
    '44dapr38': {
      'en': '300',
      'fr': '',
    },
    'lrul6fh4': {
      'en': '1000',
      'fr': '',
    },
    'fwej93op': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'u19m9chp': {
      'en': 'Feed',
      'fr': '',
    },
    '7g5zsnyf': {
      'en': '0.1',
      'fr': '',
    },
    's39uob6z': {
      'en': '\$2,100',
      'fr': '',
    },
    'jr13po11': {
      'en': '300',
      'fr': '',
    },
    'bpawrlgg': {
      'en': '1000',
      'fr': '',
    },
    '8ftgi178': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'p1tn1lf1': {
      'en': 'Feed',
      'fr': '',
    },
    'i77j77gp': {
      'en': '0.1',
      'fr': '',
    },
    'ik60q3ap': {
      'en': '\$2,100',
      'fr': '',
    },
    '0mbembt9': {
      'en': '300',
      'fr': '',
    },
    'o94nbcrx': {
      'en': '1000',
      'fr': '',
    },
    '9y1vtkfk': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    '5zsgg570': {
      'en': 'Feed',
      'fr': '',
    },
    'n7r6ldk6': {
      'en': '0.1',
      'fr': '',
    },
    '1kbakmur': {
      'en': '\$2,100',
      'fr': '',
    },
    'wo8igl9g': {
      'en': '300',
      'fr': '',
    },
    'es1it9ac': {
      'en': '1000',
      'fr': '',
    },
    'kdttu1g4': {
      'en': 'LIME',
      'fr': '',
    },
    '0ij3f23h': {
      'en': 'Feed',
      'fr': '',
    },
    'ecfsn6bb': {
      'en': '0.1',
      'fr': '',
    },
    'd5vlngvx': {
      'en': '\$2,100',
      'fr': '',
    },
    'oz4dhpjl': {
      'en': '300',
      'fr': '',
    },
    'p3wcutwl': {
      'en': '1000',
      'fr': '',
    },
    'kmo2j08n': {
      'en': 'SALT',
      'fr': '',
    },
    'pkbils8n': {
      'en': 'Feed',
      'fr': '',
    },
    'nyo9nqr2': {
      'en': '0.1',
      'fr': '',
    },
    'o3m2iufv': {
      'en': '\$2,100',
      'fr': '',
    },
    '0zlx0q9p': {
      'en': '300',
      'fr': '',
    },
    'chhvnuxm': {
      'en': '1000',
      'fr': '',
    },
    'ggkz873s': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'eknsi8aq': {
      'en': 'Feed',
      'fr': '',
    },
    'qabj5o9q': {
      'en': '0.1',
      'fr': '',
    },
    'kdnyc6nj': {
      'en': '\$2,100',
      'fr': '',
    },
    't1hmzjcg': {
      'en': '300',
      'fr': '',
    },
    '64m2tqk3': {
      'en': '1000',
      'fr': '',
    },
    'pqso2dly': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    'ltjy4gvd': {
      'en': 'Feed',
      'fr': '',
    },
    'jk7t7ul9': {
      'en': '0.1',
      'fr': '',
    },
    '5db2t3gq': {
      'en': '\$2,100',
      'fr': '',
    },
    'oq1za89p': {
      'en': '300',
      'fr': '',
    },
    'n40fs9yv': {
      'en': '1000',
      'fr': '',
    },
    'kxzuor17': {
      'en': 'Feed Components',
      'fr': '',
    },
    'bozwpkdt': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    '04eng38a': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    'jvfbigm8': {
      'en': 'Feed',
      'fr': '',
    },
    'l3664lfe': {
      'en': 'Component  (%)',
      'fr': '',
    },
    'mz9ewa80': {
      'en': 'Amount',
      'fr': '',
    },
    'mym94e7x': {
      'en': 'Index',
      'fr': '',
    },
    '745gch73': {
      'en': 'Total',
      'fr': '',
    },
    '1girugxy': {
      'en': 'MAIZE',
      'fr': '',
    },
    '8ogq6t1g': {
      'en': 'Feed',
      'fr': '',
    },
    '455dbahh': {
      'en': '0.1',
      'fr': '',
    },
    'gu17h04x': {
      'en': '\$2,100',
      'fr': '',
    },
    's5lowh5v': {
      'en': '300',
      'fr': '',
    },
    '6ox57k3a': {
      'en': '1000',
      'fr': '',
    },
    '1v2rkf0i': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'go8h7hlh': {
      'en': 'Feed',
      'fr': '',
    },
    'y7r7qxwc': {
      'en': '0.1',
      'fr': '',
    },
    '35u2bjfz': {
      'en': '\$2,100',
      'fr': '',
    },
    'gavk96ge': {
      'en': '300',
      'fr': '',
    },
    'llaxs5wn': {
      'en': '1000',
      'fr': '',
    },
    'r0i43rnk': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'ik0qo07k': {
      'en': 'Feed',
      'fr': '',
    },
    '466okpkh': {
      'en': '0.1',
      'fr': '',
    },
    'saqb81s2': {
      'en': '\$2,100',
      'fr': '',
    },
    'cu1yy5wm': {
      'en': '300',
      'fr': '',
    },
    '1od1jqqo': {
      'en': '1000',
      'fr': '',
    },
    'e402jiq5': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'ycnaj3ba': {
      'en': 'Feed',
      'fr': '',
    },
    'qtqa16mf': {
      'en': '0.1',
      'fr': '',
    },
    '9wt6ftz8': {
      'en': '\$2,100',
      'fr': '',
    },
    'jwm0hko5': {
      'en': '300',
      'fr': '',
    },
    'om7wud7w': {
      'en': '1000',
      'fr': '',
    },
    'j5cw86p5': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'fqpek6c8': {
      'en': 'Feed',
      'fr': '',
    },
    '9s7r9525': {
      'en': '0.1',
      'fr': '',
    },
    '4b6bo3bn': {
      'en': '\$2,100',
      'fr': '',
    },
    'bkon9snt': {
      'en': '300',
      'fr': '',
    },
    '3o85jcru': {
      'en': '1000',
      'fr': '',
    },
    'jk540ueg': {
      'en': 'LIME',
      'fr': '',
    },
    't8qmin9v': {
      'en': 'Feed',
      'fr': '',
    },
    'l7pvm29c': {
      'en': '0.1',
      'fr': '',
    },
    '4gsuepys': {
      'en': '\$2,100',
      'fr': '',
    },
    'ot7xwfmf': {
      'en': '300',
      'fr': '',
    },
    'ge4ggupb': {
      'en': '1000',
      'fr': '',
    },
    'a9u0x1j7': {
      'en': 'SALT',
      'fr': '',
    },
    'ltssefp3': {
      'en': 'Feed',
      'fr': '',
    },
    '3cxtc3yg': {
      'en': '0.1',
      'fr': '',
    },
    'kdlnpbg4': {
      'en': '\$2,100',
      'fr': '',
    },
    '5zphdfzg': {
      'en': '300',
      'fr': '',
    },
    '0hn2yus8': {
      'en': '1000',
      'fr': '',
    },
    'qnqcnj1a': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'ftf5gbs6': {
      'en': 'Feed',
      'fr': '',
    },
    'zwfyh3v9': {
      'en': '0.1',
      'fr': '',
    },
    '3lapikjy': {
      'en': '\$2,100',
      'fr': '',
    },
    'o79mskol': {
      'en': '300',
      'fr': '',
    },
    'z8vq0c0q': {
      'en': '1000',
      'fr': '',
    },
    '5kqjpyic': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    'sceit7b4': {
      'en': 'Feed',
      'fr': '',
    },
    'kxw9yiah': {
      'en': '0.1',
      'fr': '',
    },
    '68zarbgz': {
      'en': '\$2,100',
      'fr': '',
    },
    'm9k5h2a4': {
      'en': '300',
      'fr': '',
    },
    'itva2630': {
      'en': '1000',
      'fr': '',
    },
    'fxt9eqft': {
      'en': 'Mixing',
      'fr': '',
    },
    'snyq5485': {
      'en': 'Capital  Investment',
      'fr': '',
    },
    'o0x1l7v6': {
      'en': 'Running Costs',
      'fr': '',
    },
    'qj3w3gqx': {
      'en': 'Production Cost',
      'fr': '',
    },
    'unrketz1': {
      'en': 'Total Sales',
      'fr': '',
    },
    'whjl33ew': {
      'en': 'Profit Margins',
      'fr': '',
    },
    'lmfjwyue': {
      'en': 'Production Cost / Chicken',
      'fr': '',
    },
    '468lumde': {
      'en': 'MC Starter',
      'fr': '',
    },
    'lt2siwal': {
      'en': 'Total Used',
      'fr': '',
    },
    'zyzzuxvt': {
      'en': '562k',
      'fr': '',
    },
    'qjrzwszs': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    '69uk4pj5': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'g3utz5ug': {
      'en': 'MC Grower',
      'fr': '',
    },
    '7uf3rcaq': {
      'en': 'Total Used',
      'fr': '',
    },
    '23h0j6e2': {
      'en': '562k',
      'fr': '',
    },
    'hhuu83m1': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'i57capa9': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    '4fz1llno': {
      'en': 'MC Finisher',
      'fr': '',
    },
    'u1hm1lkp': {
      'en': 'Total Used',
      'fr': '',
    },
    's91ptn4x': {
      'en': '562k',
      'fr': '',
    },
    'uax13j90': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'dcdqqc7w': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'pg6rv4ic': {
      'en': 'Feed Components',
      'fr': '',
    },
    'pbj6qvai': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    '2v73bi0g': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    'xb2u26hw': {
      'en': 'Feed',
      'fr': '',
    },
    'vdh1ssor': {
      'en': 'Component  (%)',
      'fr': '',
    },
    '5kirdpfv': {
      'en': 'Amount',
      'fr': '',
    },
    '4a17idth': {
      'en': 'Index',
      'fr': '',
    },
    'ple7l2lv': {
      'en': 'Total',
      'fr': '',
    },
    'ndgqbyta': {
      'en': 'MAIZE',
      'fr': '',
    },
    'r2spgu28': {
      'en': 'Feed',
      'fr': '',
    },
    'k58vqtls': {
      'en': '0.1',
      'fr': '',
    },
    '97z7hwl0': {
      'en': '\$2,100',
      'fr': '',
    },
    'z4v0sgv5': {
      'en': '300',
      'fr': '',
    },
    '302m42cr': {
      'en': '1000',
      'fr': '',
    },
    '63makybs': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'lu4uzd6l': {
      'en': 'Feed',
      'fr': '',
    },
    'ox2tl7l7': {
      'en': '0.1',
      'fr': '',
    },
    'f3lkk6gb': {
      'en': '\$2,100',
      'fr': '',
    },
    'gk46a62t': {
      'en': '300',
      'fr': '',
    },
    'p02lwt7a': {
      'en': '1000',
      'fr': '',
    },
    'gt4xixba': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'yuzali9s': {
      'en': 'Feed',
      'fr': '',
    },
    'sr7uowvt': {
      'en': '0.1',
      'fr': '',
    },
    '58rmvtkh': {
      'en': '\$2,100',
      'fr': '',
    },
    'heig5j16': {
      'en': '300',
      'fr': '',
    },
    'afvsvwpx': {
      'en': '1000',
      'fr': '',
    },
    '9lrasnz1': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'rcy2kde1': {
      'en': 'Feed',
      'fr': '',
    },
    'gzkjiwe9': {
      'en': '0.1',
      'fr': '',
    },
    'eknaqbr7': {
      'en': '\$2,100',
      'fr': '',
    },
    'jvp2afw4': {
      'en': '300',
      'fr': '',
    },
    'cejcv0h0': {
      'en': '1000',
      'fr': '',
    },
    '0ddcecrw': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'e4iehyoz': {
      'en': 'Feed',
      'fr': '',
    },
    '888z3nid': {
      'en': '0.1',
      'fr': '',
    },
    '3hvbvy2k': {
      'en': '\$2,100',
      'fr': '',
    },
    'nao7ggmj': {
      'en': '300',
      'fr': '',
    },
    'nntgep9m': {
      'en': '1000',
      'fr': '',
    },
    'lh98namx': {
      'en': 'LIME',
      'fr': '',
    },
    '1r12rfd8': {
      'en': 'Feed',
      'fr': '',
    },
    'np6h0ag5': {
      'en': '0.1',
      'fr': '',
    },
    '52fujfjc': {
      'en': '\$2,100',
      'fr': '',
    },
    'z1phqzqm': {
      'en': '300',
      'fr': '',
    },
    '9xcxgd82': {
      'en': '1000',
      'fr': '',
    },
    'ocnn6nsc': {
      'en': 'SALT',
      'fr': '',
    },
    'onyq8a6l': {
      'en': 'Feed',
      'fr': '',
    },
    'xn03yrfx': {
      'en': '0.1',
      'fr': '',
    },
    'so12zqam': {
      'en': '\$2,100',
      'fr': '',
    },
    'wlf08j12': {
      'en': '300',
      'fr': '',
    },
    'ihsdzfe9': {
      'en': '1000',
      'fr': '',
    },
    '7yjcc5rt': {
      'en': 'METHIONINE',
      'fr': '',
    },
    '9xoq0hkh': {
      'en': 'Feed',
      'fr': '',
    },
    'lofs66xh': {
      'en': '0.1',
      'fr': '',
    },
    'xwtkeocq': {
      'en': '\$2,100',
      'fr': '',
    },
    'h83i7x5g': {
      'en': '300',
      'fr': '',
    },
    'hnph9ssl': {
      'en': '1000',
      'fr': '',
    },
    'lh4h5pr3': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    'zq3aiz70': {
      'en': 'Feed',
      'fr': '',
    },
    'f4qqktec': {
      'en': '0.1',
      'fr': '',
    },
    'gbilhttb': {
      'en': '\$2,100',
      'fr': '',
    },
    'c4l2ze02': {
      'en': '300',
      'fr': '',
    },
    'c8kd5e4y': {
      'en': '1000',
      'fr': '',
    },
    'mcnzit0j': {
      'en': 'Feed Components',
      'fr': '',
    },
    '0aqivrwu': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    'bi666gep': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    'okws81fl': {
      'en': 'Feed',
      'fr': '',
    },
    '4oboy9r3': {
      'en': 'Component  (%)',
      'fr': '',
    },
    'usk8253n': {
      'en': 'Amount',
      'fr': '',
    },
    'g6ux7x5r': {
      'en': 'Index',
      'fr': '',
    },
    '4nmj6f86': {
      'en': 'Total',
      'fr': '',
    },
    'v39h1df9': {
      'en': 'MAIZE',
      'fr': '',
    },
    'wd9m9jn8': {
      'en': 'Feed',
      'fr': '',
    },
    'ihh1tjj0': {
      'en': '0.1',
      'fr': '',
    },
    'wwdjm4tg': {
      'en': '\$2,100',
      'fr': '',
    },
    'z29wu2jx': {
      'en': '300',
      'fr': '',
    },
    'j8fz6lq8': {
      'en': '1000',
      'fr': '',
    },
    'gt3rgwnd': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'ai4b83kt': {
      'en': 'Feed',
      'fr': '',
    },
    '4i3qj2bh': {
      'en': '0.1',
      'fr': '',
    },
    'gxgax1ci': {
      'en': '\$2,100',
      'fr': '',
    },
    'a8bx7p45': {
      'en': '300',
      'fr': '',
    },
    'jsf37jml': {
      'en': '1000',
      'fr': '',
    },
    '00ygjtu0': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'xi196xvm': {
      'en': 'Feed',
      'fr': '',
    },
    'r5xxulhw': {
      'en': '0.1',
      'fr': '',
    },
    'blv3h7fm': {
      'en': '\$2,100',
      'fr': '',
    },
    'qi1jn7d9': {
      'en': '300',
      'fr': '',
    },
    'u9chf9p5': {
      'en': '1000',
      'fr': '',
    },
    'svzj2b9h': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    '67u2cvs6': {
      'en': 'Feed',
      'fr': '',
    },
    '6j6tn59d': {
      'en': '0.1',
      'fr': '',
    },
    'raht5ujx': {
      'en': '\$2,100',
      'fr': '',
    },
    '6a0mrag3': {
      'en': '300',
      'fr': '',
    },
    '1hn4w29s': {
      'en': '1000',
      'fr': '',
    },
    'ifay6zci': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    '0a6leqe1': {
      'en': 'Feed',
      'fr': '',
    },
    'khj8ozlm': {
      'en': '0.1',
      'fr': '',
    },
    'xtlh1yyx': {
      'en': '\$2,100',
      'fr': '',
    },
    'kcah5z9m': {
      'en': '300',
      'fr': '',
    },
    'zh6p73ww': {
      'en': '1000',
      'fr': '',
    },
    'kxfoy7v8': {
      'en': 'LIME',
      'fr': '',
    },
    'k6dlo29j': {
      'en': 'Feed',
      'fr': '',
    },
    '90v40ewn': {
      'en': '0.1',
      'fr': '',
    },
    'lcbnupob': {
      'en': '\$2,100',
      'fr': '',
    },
    'q6pwlnar': {
      'en': '300',
      'fr': '',
    },
    'j0f8so2r': {
      'en': '1000',
      'fr': '',
    },
    'vdh7q7zw': {
      'en': 'SALT',
      'fr': '',
    },
    '646w8ip3': {
      'en': 'Feed',
      'fr': '',
    },
    'n3wjq77r': {
      'en': '0.1',
      'fr': '',
    },
    '0pehfycn': {
      'en': '\$2,100',
      'fr': '',
    },
    'zi5o9x69': {
      'en': '300',
      'fr': '',
    },
    'thb1mo84': {
      'en': '1000',
      'fr': '',
    },
    '5nzk6ns5': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'm6io36vf': {
      'en': 'Feed',
      'fr': '',
    },
    'u91q0tqk': {
      'en': '0.1',
      'fr': '',
    },
    'i83mz6l2': {
      'en': '\$2,100',
      'fr': '',
    },
    'esmj1o3r': {
      'en': '300',
      'fr': '',
    },
    'sz6zrht4': {
      'en': '1000',
      'fr': '',
    },
    'l1p0zmru': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    'd51inmez': {
      'en': 'Feed',
      'fr': '',
    },
    'gcrd09gu': {
      'en': '0.1',
      'fr': '',
    },
    'uq386dqe': {
      'en': '\$2,100',
      'fr': '',
    },
    'dk1wjpld': {
      'en': '300',
      'fr': '',
    },
    '0dmnjxqm': {
      'en': '1000',
      'fr': '',
    },
    '8w0apyq6': {
      'en': 'Feed Components',
      'fr': '',
    },
    'qnqecojw': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    '6foccve2': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    'dcuxirxz': {
      'en': 'Feed',
      'fr': '',
    },
    'wdw2i0vi': {
      'en': 'Component  (%)',
      'fr': '',
    },
    'wjz4mkrc': {
      'en': 'Amount',
      'fr': '',
    },
    'a323x7o2': {
      'en': 'Index',
      'fr': '',
    },
    '7q3iajx4': {
      'en': 'Total',
      'fr': '',
    },
    'sdy9vf0r': {
      'en': 'MAIZE',
      'fr': '',
    },
    'aonmyf29': {
      'en': 'Feed',
      'fr': '',
    },
    'coth307n': {
      'en': '0.1',
      'fr': '',
    },
    'giskgww7': {
      'en': '\$2,100',
      'fr': '',
    },
    '8ky1z5y5': {
      'en': '300',
      'fr': '',
    },
    'cw5kwisy': {
      'en': '1000',
      'fr': '',
    },
    'j7diqwin': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'pvdkq5ga': {
      'en': 'Feed',
      'fr': '',
    },
    'xdvhl8pq': {
      'en': '0.1',
      'fr': '',
    },
    'hgu01da3': {
      'en': '\$2,100',
      'fr': '',
    },
    'cshppfla': {
      'en': '300',
      'fr': '',
    },
    'szp9eg61': {
      'en': '1000',
      'fr': '',
    },
    'ryc8xvz9': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    '83281hp1': {
      'en': 'Feed',
      'fr': '',
    },
    'm1lqgk66': {
      'en': '0.1',
      'fr': '',
    },
    '8ll005ot': {
      'en': '\$2,100',
      'fr': '',
    },
    'oa9qhotb': {
      'en': '300',
      'fr': '',
    },
    'g82kiiuw': {
      'en': '1000',
      'fr': '',
    },
    'x4b9gawi': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    '9b1o80fi': {
      'en': 'Feed',
      'fr': '',
    },
    'soshp4gr': {
      'en': '0.1',
      'fr': '',
    },
    'mbbrgc1p': {
      'en': '\$2,100',
      'fr': '',
    },
    'u0boa669': {
      'en': '300',
      'fr': '',
    },
    't8dr7hqu': {
      'en': '1000',
      'fr': '',
    },
    'tz17a1tu': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'r4vae4pi': {
      'en': 'Feed',
      'fr': '',
    },
    '2l6gec0b': {
      'en': '0.1',
      'fr': '',
    },
    'nzaf0tzr': {
      'en': '\$2,100',
      'fr': '',
    },
    'mxxndski': {
      'en': '300',
      'fr': '',
    },
    '3dx1nx9b': {
      'en': '1000',
      'fr': '',
    },
    'sbc6b347': {
      'en': 'LIME',
      'fr': '',
    },
    '7346t5me': {
      'en': 'Feed',
      'fr': '',
    },
    '7zv9bwl1': {
      'en': '0.1',
      'fr': '',
    },
    'piijrc2u': {
      'en': '\$2,100',
      'fr': '',
    },
    'ixc9l33p': {
      'en': '300',
      'fr': '',
    },
    '8hkowhne': {
      'en': '1000',
      'fr': '',
    },
    'i1h8takj': {
      'en': 'SALT',
      'fr': '',
    },
    '6vei9dk0': {
      'en': 'Feed',
      'fr': '',
    },
    'yvnb4s57': {
      'en': '0.1',
      'fr': '',
    },
    '26gqdxda': {
      'en': '\$2,100',
      'fr': '',
    },
    '1ui6t431': {
      'en': '300',
      'fr': '',
    },
    'bklttrez': {
      'en': '1000',
      'fr': '',
    },
    'sipwlti3': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'tuogi4p3': {
      'en': 'Feed',
      'fr': '',
    },
    'j1zey5h4': {
      'en': '0.1',
      'fr': '',
    },
    'liervzeg': {
      'en': '\$2,100',
      'fr': '',
    },
    'xe0n36hn': {
      'en': '300',
      'fr': '',
    },
    '564pahd8': {
      'en': '1000',
      'fr': '',
    },
    '4vhn090n': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    '7j3moj5a': {
      'en': 'Feed',
      'fr': '',
    },
    'hs58mpek': {
      'en': '0.1',
      'fr': '',
    },
    'whjrxowg': {
      'en': '\$2,100',
      'fr': '',
    },
    'z4jxp6c3': {
      'en': '300',
      'fr': '',
    },
    '2a0vngqd': {
      'en': '1000',
      'fr': '',
    },
    '3yjedonj': {
      'en': 'Buy',
      'fr': '',
    },
    '155hammk': {
      'en': 'Capital  Investment',
      'fr': '',
    },
    'iwhpyhht': {
      'en': 'Running Costs',
      'fr': '',
    },
    '4g9kgvee': {
      'en': 'Production Cost',
      'fr': '',
    },
    '4m73e2kf': {
      'en': 'Total Sales',
      'fr': '',
    },
    'vfc80qww': {
      'en': 'Profit Margins',
      'fr': '',
    },
    'olrqpv65': {
      'en': 'Production Cost / Chicken',
      'fr': '',
    },
    '22dm1nma': {
      'en': 'MC Starter',
      'fr': '',
    },
    'mxbsjtah': {
      'en': 'Total Used',
      'fr': '',
    },
    'bkro9atj': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    '5v55s5ru': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'p6xavrzf': {
      'en': 'MC Grower',
      'fr': '',
    },
    'mykt1xqo': {
      'en': 'Total Used',
      'fr': '',
    },
    'ez3t5uf6': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    '96bzc8mb': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'zm7waoep': {
      'en': 'MC Finisher',
      'fr': '',
    },
    'buks1h60': {
      'en': 'Total Used',
      'fr': '',
    },
    'baf2ms0v': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    '6dwms5uq': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    '4rw6x6ax': {
      'en': 'Make',
      'fr': '',
    },
    'o7yqkhin': {
      'en': 'Capital  Investment',
      'fr': '',
    },
    'auhx8hd1': {
      'en': 'Running Costs',
      'fr': '',
    },
    'cim8tf03': {
      'en': 'Production Cost',
      'fr': '',
    },
    'ilhkz7ah': {
      'en': 'Total Sales',
      'fr': '',
    },
    'c6nywy98': {
      'en': 'Profit Margins',
      'fr': '',
    },
    'hpyavx8n': {
      'en': 'Production Cost / Chicken',
      'fr': '',
    },
    'fvth3uz4': {
      'en': 'MC Starter',
      'fr': '',
    },
    '4p47qvmo': {
      'en': 'Total Used',
      'fr': '',
    },
    '1hwgn080': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'laxkw4im': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    '2kzkwy9v': {
      'en': 'MC Grower',
      'fr': '',
    },
    'ienq46fz': {
      'en': 'Total Used',
      'fr': '',
    },
    '0rcxi7th': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'tu096grg': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    '6ew7hv7j': {
      'en': 'MC Finisher',
      'fr': '',
    },
    '66up3asg': {
      'en': 'Total Used',
      'fr': '',
    },
    'hc60meqa': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'xn7spmee': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'bqt723cm': {
      'en': 'Mixing',
      'fr': '',
    },
    'b5cft29a': {
      'en': 'Capital  Investment',
      'fr': '',
    },
    'q4x5dr7z': {
      'en': 'Running Costs',
      'fr': '',
    },
    'q26i2q1p': {
      'en': 'Production Cost',
      'fr': '',
    },
    'ljlzk2rh': {
      'en': 'Total Sales',
      'fr': '',
    },
    '8fcqqe2y': {
      'en': 'Profit Margins',
      'fr': '',
    },
    'h1pv5li3': {
      'en': 'Production Cost / Chicken',
      'fr': '',
    },
    '59nk1xr3': {
      'en': 'MC Starter',
      'fr': '',
    },
    'xql3kgdd': {
      'en': 'Total Used',
      'fr': '',
    },
    'd2hyasne': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'hkzol4gh': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    '7ifqxwyt': {
      'en': 'MC Grower',
      'fr': '',
    },
    's306oka1': {
      'en': 'Total Used',
      'fr': '',
    },
    '7ca1ss67': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    '24hwuo5k': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    '5o1li316': {
      'en': 'MC Finisher',
      'fr': '',
    },
    'wh610ruv': {
      'en': 'Total Used',
      'fr': '',
    },
    'um2c9ksp': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'k11mhint': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    't5pg6f68': {
      'en': 'Starter',
      'fr': '',
    },
    'aj9ihm28': {
      'en': 'MC Starter',
      'fr': '',
    },
    'crs57zjh': {
      'en': 'Total Used',
      'fr': '',
    },
    '6u8todie': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'gb488xsz': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'qqwwhi8w': {
      'en': 'Feed Components',
      'fr': '',
    },
    'bxocyy6g': {
      'en': 'Feed  Cost depending on the chicken category.',
      'fr': '',
    },
    'd1fq2nwc': {
      'en': 'Update Feed Cost',
      'fr': '',
    },
    'lly68qu5': {
      'en': 'Work Type',
      'fr': '',
    },
    'wmus7ypv': {
      'en': 'Feed',
      'fr': '',
    },
    'r7fy2p3u': {
      'en': 'Contract Amount',
      'fr': '',
    },
    'tply7g1v': {
      'en': 'Component (%)',
      'fr': '',
    },
    '8jidb3gd': {
      'en': 'Total',
      'fr': '',
    },
    'tykxgmwn': {
      'en': 'Design Work',
      'fr': '',
    },
    'u9cn7em9': {
      'en': 'MAIZE',
      'fr': '',
    },
    '27hf124m': {
      'en': '4.26',
      'fr': '',
    },
    'f5sjcg1i': {
      'en': '\$2,100',
      'fr': '',
    },
    'cq2r735w': {
      'en': '47',
      'fr': '',
    },
    'oskv51tg': {
      'en': 'Design Work',
      'fr': '',
    },
    '6yglytdo': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    '0fden28g': {
      'en': '8.00',
      'fr': '',
    },
    'bzrsytkc': {
      'en': '\$2,100',
      'fr': '',
    },
    'dum2cx6y': {
      'en': '25',
      'fr': '',
    },
    'f1igam01': {
      'en': 'Design Work',
      'fr': '',
    },
    'gf90ouoq': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'nshc09xj': {
      'en': '10.00',
      'fr': '',
    },
    'd97xyuph': {
      'en': '\$2,100',
      'fr': '',
    },
    'nzbdqrop': {
      'en': '20',
      'fr': '',
    },
    '93u7f2y8': {
      'en': 'Design Work',
      'fr': '',
    },
    'g3wubk1q': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'xiq26plq': {
      'en': '51.28',
      'fr': '',
    },
    'qsoffkq2': {
      'en': '\$2,100',
      'fr': '',
    },
    '2vea9nwj': {
      'en': '3.9',
      'fr': '',
    },
    '1j9n23w4': {
      'en': 'Design Work',
      'fr': '',
    },
    'tm4q8sr2': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'z8hy89yd': {
      'en': '90.91',
      'fr': '',
    },
    'vr1o62kq': {
      'en': '\$2,100',
      'fr': '',
    },
    '1brmtrw0': {
      'en': '2.2',
      'fr': '',
    },
    '3fc9jnc9': {
      'en': 'Design Work',
      'fr': '',
    },
    'x6l4p3tc': {
      'en': 'LIME',
      'fr': '',
    },
    'boz9a7zm': {
      'en': '222.22',
      'fr': '',
    },
    'preuqigp': {
      'en': '\$2,100',
      'fr': '',
    },
    'hfg0qonp': {
      'en': '0.9',
      'fr': '',
    },
    'uclu5460': {
      'en': 'Design Work',
      'fr': '',
    },
    '2p2hgi9t': {
      'en': 'SALT',
      'fr': '',
    },
    'kj1rfj42': {
      'en': '500.00',
      'fr': '',
    },
    'smgx5bnj': {
      'en': '\$2,100',
      'fr': '',
    },
    'gszwpouh': {
      'en': '0.4',
      'fr': '',
    },
    '6nxyt66k': {
      'en': 'Design Work',
      'fr': '',
    },
    '2dkaon01': {
      'en': 'METHIONINE',
      'fr': '',
    },
    '3kwdndf5': {
      'en': '666.67',
      'fr': '',
    },
    'o37hz8bp': {
      'en': '\$2,100',
      'fr': '',
    },
    'egxy6289': {
      'en': '0.3',
      'fr': '',
    },
    'ynz6a6so': {
      'en': 'Design Work',
      'fr': '',
    },
    '433mkzj3': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    'thlpip3h': {
      'en': '666.67',
      'fr': '',
    },
    'zi8mxq6t': {
      'en': '\$2,100',
      'fr': '',
    },
    'wth693et': {
      'en': '0.3',
      'fr': '',
    },
    '6ary1bss': {
      'en': 'Grower',
      'fr': '',
    },
    '0hl2zfcc': {
      'en': 'MC Grower',
      'fr': '',
    },
    'ni4x1iz7': {
      'en': 'Total Used',
      'fr': '',
    },
    '7duurxkp': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    '26xppibj': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'g0vfkgjy': {
      'en': 'Feed Components',
      'fr': '',
    },
    '2zaca31a': {
      'en': 'Feed  Cost depending on the chicken category.',
      'fr': '',
    },
    'a6pl54t8': {
      'en': 'Update Feed Cost',
      'fr': '',
    },
    'rjf5c9ot': {
      'en': 'Work Type',
      'fr': '',
    },
    't8f2e25p': {
      'en': 'Feed',
      'fr': '',
    },
    'bjwhhhqv': {
      'en': 'Contract Amount',
      'fr': '',
    },
    'up4v5ucu': {
      'en': 'Component (%)',
      'fr': '',
    },
    'w2lki9cb': {
      'en': 'Total',
      'fr': '',
    },
    'n3b232y6': {
      'en': 'Design Work',
      'fr': '',
    },
    'yo7fyqs5': {
      'en': 'MAIZE',
      'fr': '',
    },
    '3brt4hc9': {
      'en': '0.68',
      'fr': '',
    },
    'ickz6pmw': {
      'en': '\$2,100',
      'fr': '',
    },
    'xms1j5jn': {
      'en': '59',
      'fr': '',
    },
    'bnucc17z': {
      'en': 'Design Work',
      'fr': '',
    },
    'xjqt9z7v': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'a8esoj8x': {
      'en': '2.00',
      'fr': '',
    },
    'rbt05yho': {
      'en': '\$2,100',
      'fr': '',
    },
    'tc48kdew': {
      'en': '20',
      'fr': '',
    },
    '2cx14jz4': {
      'en': 'Design Work',
      'fr': '',
    },
    '6hrnpx07': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    '62t6js1d': {
      'en': '2.67',
      'fr': '',
    },
    'woxpyqnu': {
      'en': '\$2,100',
      'fr': '',
    },
    'yp3mjl9s': {
      'en': '15',
      'fr': '',
    },
    'tlyrswjk': {
      'en': 'Design Work',
      'fr': '',
    },
    'bkyzrmwq': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'l48ypvx0': {
      'en': '20.00',
      'fr': '',
    },
    'qe2aufxn': {
      'en': '\$2,100',
      'fr': '',
    },
    'sags3e3y': {
      'en': '2',
      'fr': '',
    },
    'tb7q6zdz': {
      'en': 'Design Work',
      'fr': '',
    },
    't093m2h7': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    '6hdzs0jj': {
      'en': '18.18',
      'fr': '',
    },
    'y8l533oh': {
      'en': '\$2,100',
      'fr': '',
    },
    '9nfp4dkw': {
      'en': '2.2',
      'fr': '',
    },
    '7y7hedyx': {
      'en': 'Design Work',
      'fr': '',
    },
    'z0jkirxv': {
      'en': 'LIME',
      'fr': '',
    },
    'kq2v6cxw': {
      'en': '44.44',
      'fr': '',
    },
    'ql2phwhg': {
      'en': '\$2,100',
      'fr': '',
    },
    'jgq1fe08': {
      'en': '0.9',
      'fr': '',
    },
    'snvy23gt': {
      'en': 'Design Work',
      'fr': '',
    },
    'txnkwhmh': {
      'en': 'SALT',
      'fr': '',
    },
    'g680pivw': {
      'en': '100.00',
      'fr': '',
    },
    '7nke3rds': {
      'en': '\$2,100',
      'fr': '',
    },
    'ekg9usun': {
      'en': '0.4',
      'fr': '',
    },
    '3ro6fm18': {
      'en': 'Design Work',
      'fr': '',
    },
    'wd57im7g': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'kafaky43': {
      'en': '200.00',
      'fr': '',
    },
    'bmtrhro5': {
      'en': '\$2,100',
      'fr': '',
    },
    '54kd09t2': {
      'en': '0.2',
      'fr': '',
    },
    's7oav0wf': {
      'en': 'Design Work',
      'fr': '',
    },
    'swbsqu8k': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    '9e09nj06': {
      'en': '133.33',
      'fr': '',
    },
    '4ttmbt78': {
      'en': '\$2,100',
      'fr': '',
    },
    'u5eoydd1': {
      'en': '0.3',
      'fr': '',
    },
    'w2k0ixhb': {
      'en': 'Finisher',
      'fr': '',
    },
    'so0q82ym': {
      'en': 'MC Finisher',
      'fr': '',
    },
    '6axcaiuw': {
      'en': 'Total Used',
      'fr': '',
    },
    'zckggxli': {
      'en': 'You’ve almost reached your limit',
      'fr': '',
    },
    'tcd0qaun': {
      'en': 'You have used 100% of your Feeds requests. ',
      'fr': '',
    },
    'qoo9yabl': {
      'en': 'Feed Components',
      'fr': '',
    },
    'kocydqv5': {
      'en': 'Feed  Cost depending on the chicken category.',
      'fr': '',
    },
    '5l1fr6xf': {
      'en': 'Update Feed Cost',
      'fr': '',
    },
    '2h0ywt1b': {
      'en': 'Work Type',
      'fr': '',
    },
    '8p10yhe0': {
      'en': 'Feed',
      'fr': '',
    },
    'ieumsfxp': {
      'en': 'Contract Amount',
      'fr': '',
    },
    'jw3a84b7': {
      'en': 'Component (%)',
      'fr': '',
    },
    'vmnjtd9l': {
      'en': 'Total',
      'fr': '',
    },
    'wgndesvg': {
      'en': 'Design Work',
      'fr': '',
    },
    '4qvo6nzp': {
      'en': 'MAIZE',
      'fr': '',
    },
    'slnnfw15': {
      'en': '2.04',
      'fr': '',
    },
    '3cjk48zy': {
      'en': '\$2,100',
      'fr': '',
    },
    '9cwbziwz': {
      'en': '49',
      'fr': '',
    },
    '91ufx595': {
      'en': 'Design Work',
      'fr': '',
    },
    'dayg0p12': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'lopdl3sw': {
      'en': '3.57',
      'fr': '',
    },
    'q6cjeq67': {
      'en': '\$2,100',
      'fr': '',
    },
    'qoqed73n': {
      'en': '28',
      'fr': '',
    },
    '4a9trcjw': {
      'en': 'Design Work',
      'fr': '',
    },
    '1d1xdfev': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'dhkdxzxe': {
      'en': '5.88',
      'fr': '',
    },
    'shw48qmk': {
      'en': '\$2,100',
      'fr': '',
    },
    '78mdmr7j': {
      'en': '17',
      'fr': '',
    },
    'mylsmnn7': {
      'en': 'Design Work',
      'fr': '',
    },
    'd97trcb9': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'o5wdjrkd': {
      'en': '50.00',
      'fr': '',
    },
    'aahr7wgs': {
      'en': '\$2,100',
      'fr': '',
    },
    'f7au5idv': {
      'en': '2',
      'fr': '',
    },
    'z69if4yp': {
      'en': 'Design Work',
      'fr': '',
    },
    'lspd55v5': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'm3ftdu6h': {
      'en': '45.45',
      'fr': '',
    },
    'uqqujg51': {
      'en': '\$2,100',
      'fr': '',
    },
    'cia98bu5': {
      'en': '2.2',
      'fr': '',
    },
    '3lncdokr': {
      'en': 'Design Work',
      'fr': '',
    },
    'ttjr11ye': {
      'en': 'LIME',
      'fr': '',
    },
    'vl1xh1da': {
      'en': '111.11',
      'fr': '',
    },
    'p44c7gnl': {
      'en': '\$2,100',
      'fr': '',
    },
    '90om2cg7': {
      'en': '0.9',
      'fr': '',
    },
    'kgskokno': {
      'en': 'Design Work',
      'fr': '',
    },
    'wapv1fqz': {
      'en': 'SALT',
      'fr': '',
    },
    'dtqcv684': {
      'en': '250.00',
      'fr': '',
    },
    'vpcvol2s': {
      'en': '\$2,100',
      'fr': '',
    },
    'k59i597k': {
      'en': '0.4',
      'fr': '',
    },
    'ehmtp6f7': {
      'en': 'Design Work',
      'fr': '',
    },
    'ngoq4pgt': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'jeefo7zb': {
      'en': '500.00',
      'fr': '',
    },
    '7ws907tb': {
      'en': '\$2,100',
      'fr': '',
    },
    'm4trnza3': {
      'en': '0.2',
      'fr': '',
    },
    's8yjm1i6': {
      'en': 'Design Work',
      'fr': '',
    },
    '1dda336i': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    'ab2is2r9': {
      'en': '333.33',
      'fr': '',
    },
    '66tpso7t': {
      'en': '\$2,100',
      'fr': '',
    },
    'ixlrumni': {
      'en': '0.3',
      'fr': '',
    },
    'arb97eyn': {
      'en': 'Feed Components',
      'fr': '',
    },
    'ade4oew2': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    '8wd6x0qe': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    '6dw248ps': {
      'en': 'Feed',
      'fr': '',
    },
    '9z64m08y': {
      'en': 'Component  (%)',
      'fr': '',
    },
    'xl49vomq': {
      'en': 'Amount',
      'fr': '',
    },
    '6bwfnkqn': {
      'en': 'Index',
      'fr': '',
    },
    'o3nd7os3': {
      'en': 'Total',
      'fr': '',
    },
    '9zj4cy2q': {
      'en': 'MAIZE',
      'fr': '',
    },
    '3drlmpiy': {
      'en': 'Feed',
      'fr': '',
    },
    'nuyu7727': {
      'en': '0.1',
      'fr': '',
    },
    'gxz7vh5b': {
      'en': '\$2,100',
      'fr': '',
    },
    'c5pg4v73': {
      'en': '300',
      'fr': '',
    },
    'c388ths8': {
      'en': '1000',
      'fr': '',
    },
    'xikzrc3r': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    '3de0kzol': {
      'en': 'Feed',
      'fr': '',
    },
    'ix9c4aip': {
      'en': '0.1',
      'fr': '',
    },
    'f77zbhni': {
      'en': '\$2,100',
      'fr': '',
    },
    'wfpxbfmg': {
      'en': '300',
      'fr': '',
    },
    'pilhx5bp': {
      'en': '1000',
      'fr': '',
    },
    'k0fxiakw': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'iy5fo9rg': {
      'en': 'Feed',
      'fr': '',
    },
    '5s35p6xp': {
      'en': '0.1',
      'fr': '',
    },
    'yo0nu0qi': {
      'en': '\$2,100',
      'fr': '',
    },
    'adbzcmfy': {
      'en': '300',
      'fr': '',
    },
    'f7vjyxij': {
      'en': '1000',
      'fr': '',
    },
    'o6flycdr': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    '0agepkha': {
      'en': 'Feed',
      'fr': '',
    },
    'o6vr4eje': {
      'en': '0.1',
      'fr': '',
    },
    'knt94uay': {
      'en': '\$2,100',
      'fr': '',
    },
    'q428bkoj': {
      'en': '300',
      'fr': '',
    },
    '1ar53qzn': {
      'en': '1000',
      'fr': '',
    },
    'k7yfylii': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'jdt3mssw': {
      'en': 'Feed',
      'fr': '',
    },
    'bxg8toyi': {
      'en': '0.1',
      'fr': '',
    },
    '1nom0sxa': {
      'en': '\$2,100',
      'fr': '',
    },
    'ux7yso89': {
      'en': '300',
      'fr': '',
    },
    'f3ktei0s': {
      'en': '1000',
      'fr': '',
    },
    'fb3gazxy': {
      'en': 'LIME',
      'fr': '',
    },
    'e8ztub34': {
      'en': 'Feed',
      'fr': '',
    },
    'ejtfu74j': {
      'en': '0.1',
      'fr': '',
    },
    'nxmcz2vg': {
      'en': '\$2,100',
      'fr': '',
    },
    'lnsszn7p': {
      'en': '300',
      'fr': '',
    },
    'biwkaej8': {
      'en': '1000',
      'fr': '',
    },
    'bon2baet': {
      'en': 'SALT',
      'fr': '',
    },
    '6ue280td': {
      'en': 'Feed',
      'fr': '',
    },
    'ld9iywrm': {
      'en': '0.1',
      'fr': '',
    },
    'xa9jkpvn': {
      'en': '\$2,100',
      'fr': '',
    },
    'zak36pss': {
      'en': '300',
      'fr': '',
    },
    'tqgt2lgz': {
      'en': '1000',
      'fr': '',
    },
    'hh01yvle': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'fpznhyo6': {
      'en': 'Feed',
      'fr': '',
    },
    'zbj9loet': {
      'en': '0.1',
      'fr': '',
    },
    'lmdd621o': {
      'en': '\$2,100',
      'fr': '',
    },
    '1wkljlg3': {
      'en': '300',
      'fr': '',
    },
    '4dtbj8aa': {
      'en': '1000',
      'fr': '',
    },
    '1j7nkcrl': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    'nqeahdzl': {
      'en': 'Feed',
      'fr': '',
    },
    'vowpj5ft': {
      'en': '0.1',
      'fr': '',
    },
    'a5edwovp': {
      'en': '\$2,100',
      'fr': '',
    },
    'iq7lw9w9': {
      'en': '300',
      'fr': '',
    },
    'u0fa9sud': {
      'en': '1000',
      'fr': '',
    },
    'e9cxeyvw': {
      'en': 'Feed Components',
      'fr': '',
    },
    'qv5b9apt': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    '0pdu5tfk': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    'swo2gvr7': {
      'en': 'Feed',
      'fr': '',
    },
    'm98omd4a': {
      'en': 'Component  (%)',
      'fr': '',
    },
    'hvjqet26': {
      'en': 'Amount',
      'fr': '',
    },
    'd85y37hg': {
      'en': 'Index',
      'fr': '',
    },
    'r69miyf9': {
      'en': 'Total',
      'fr': '',
    },
    '8fc6pvip': {
      'en': 'MAIZE',
      'fr': '',
    },
    'uaqet5xt': {
      'en': 'Feed',
      'fr': '',
    },
    'kd6nqod0': {
      'en': '0.1',
      'fr': '',
    },
    'tbtduhcz': {
      'en': '\$2,100',
      'fr': '',
    },
    'p8j4sw57': {
      'en': '300',
      'fr': '',
    },
    'b6mahzfa': {
      'en': '1000',
      'fr': '',
    },
    'cltoiv8j': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'c3j1w3ov': {
      'en': 'Feed',
      'fr': '',
    },
    '1rlrf8mm': {
      'en': '0.1',
      'fr': '',
    },
    'd8gruyl9': {
      'en': '\$2,100',
      'fr': '',
    },
    'bef4y943': {
      'en': '300',
      'fr': '',
    },
    'kyivm575': {
      'en': '1000',
      'fr': '',
    },
    'nt1rhrqb': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    '3sgr1br3': {
      'en': 'Feed',
      'fr': '',
    },
    'p2zjo6xj': {
      'en': '0.1',
      'fr': '',
    },
    '7xhnose5': {
      'en': '\$2,100',
      'fr': '',
    },
    'gkni8mm9': {
      'en': '300',
      'fr': '',
    },
    '63adhd6j': {
      'en': '1000',
      'fr': '',
    },
    'owp39qfv': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'wov457dx': {
      'en': 'Feed',
      'fr': '',
    },
    '3a2g0pmi': {
      'en': '0.1',
      'fr': '',
    },
    'cae3frcm': {
      'en': '\$2,100',
      'fr': '',
    },
    'xq75z26x': {
      'en': '300',
      'fr': '',
    },
    '95wzyvof': {
      'en': '1000',
      'fr': '',
    },
    '4zg5nkob': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'oqn1p7c2': {
      'en': 'Feed',
      'fr': '',
    },
    '78sk2071': {
      'en': '0.1',
      'fr': '',
    },
    '7mc8niba': {
      'en': '\$2,100',
      'fr': '',
    },
    'd2b112ba': {
      'en': '300',
      'fr': '',
    },
    '33b8ire6': {
      'en': '1000',
      'fr': '',
    },
    'vpqlkofw': {
      'en': 'LIME',
      'fr': '',
    },
    'pfuxfop4': {
      'en': 'Feed',
      'fr': '',
    },
    'u0u2fx0i': {
      'en': '0.1',
      'fr': '',
    },
    'or7ghn83': {
      'en': '\$2,100',
      'fr': '',
    },
    'yh4vtcik': {
      'en': '300',
      'fr': '',
    },
    'ufbtstps': {
      'en': '1000',
      'fr': '',
    },
    'dfbf4ru1': {
      'en': 'SALT',
      'fr': '',
    },
    's4ubwhmj': {
      'en': 'Feed',
      'fr': '',
    },
    'bbfddfno': {
      'en': '0.1',
      'fr': '',
    },
    '6gma7xnm': {
      'en': '\$2,100',
      'fr': '',
    },
    'vhvl1ia0': {
      'en': '300',
      'fr': '',
    },
    'sj0x5rry': {
      'en': '1000',
      'fr': '',
    },
    '4n1f4y70': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'mwhqj950': {
      'en': 'Feed',
      'fr': '',
    },
    'b9lny4in': {
      'en': '0.1',
      'fr': '',
    },
    'et373ggl': {
      'en': '\$2,100',
      'fr': '',
    },
    '7xs5u0w2': {
      'en': '300',
      'fr': '',
    },
    'do0209vo': {
      'en': '1000',
      'fr': '',
    },
    'jd0yjac4': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    'y7c8htj5': {
      'en': 'Feed',
      'fr': '',
    },
    '9conu9af': {
      'en': '0.1',
      'fr': '',
    },
    'ucskjntv': {
      'en': '\$2,100',
      'fr': '',
    },
    'u2jelaha': {
      'en': '300',
      'fr': '',
    },
    'ioc6on5o': {
      'en': '1000',
      'fr': '',
    },
    'h031u56v': {
      'en': 'Feed Components',
      'fr': '',
    },
    'ysq5qs6g': {
      'en': 'Feed Components Cost depending on the chicken Category',
      'fr': '',
    },
    '3005ttke': {
      'en': 'Add Feed Cost',
      'fr': '',
    },
    'carwfqso': {
      'en': 'Feed',
      'fr': '',
    },
    'a9pytonp': {
      'en': 'Component  (%)',
      'fr': '',
    },
    'u6rbs798': {
      'en': 'Amount',
      'fr': '',
    },
    'umkpuww6': {
      'en': 'Index',
      'fr': '',
    },
    'chg3hfy3': {
      'en': 'Total',
      'fr': '',
    },
    'zstxqsva': {
      'en': 'MAIZE',
      'fr': '',
    },
    'r1y9al3m': {
      'en': 'Feed',
      'fr': '',
    },
    'e1oq66ni': {
      'en': '0.1',
      'fr': '',
    },
    'wjm5qdnb': {
      'en': '\$2,100',
      'fr': '',
    },
    'ven6c0vx': {
      'en': '300',
      'fr': '',
    },
    'arqtuesg': {
      'en': '1000',
      'fr': '',
    },
    'vja755ht': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    '91zudlal': {
      'en': 'Feed',
      'fr': '',
    },
    'f2e4j28c': {
      'en': '0.1',
      'fr': '',
    },
    'o8qujxw4': {
      'en': '\$2,100',
      'fr': '',
    },
    'qak9ubm7': {
      'en': '300',
      'fr': '',
    },
    '8gtyrqg2': {
      'en': '1000',
      'fr': '',
    },
    '8gqadbpq': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    'rb0dikim': {
      'en': 'Feed',
      'fr': '',
    },
    'bndvz8w9': {
      'en': '0.1',
      'fr': '',
    },
    'mdsp86xj': {
      'en': '\$2,100',
      'fr': '',
    },
    'pqmqzkor': {
      'en': '300',
      'fr': '',
    },
    'mwfp70rn': {
      'en': '1000',
      'fr': '',
    },
    '03lcdusp': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'st6eyy90': {
      'en': 'Feed',
      'fr': '',
    },
    'nza5btb1': {
      'en': '0.1',
      'fr': '',
    },
    'q1yevuxd': {
      'en': '\$2,100',
      'fr': '',
    },
    'wmf06241': {
      'en': '300',
      'fr': '',
    },
    'sax6ptpa': {
      'en': '1000',
      'fr': '',
    },
    '4325b3yv': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'nbbewbkk': {
      'en': 'Feed',
      'fr': '',
    },
    'sqsayykt': {
      'en': '0.1',
      'fr': '',
    },
    'ffckgt02': {
      'en': '\$2,100',
      'fr': '',
    },
    'bwg6zwhx': {
      'en': '300',
      'fr': '',
    },
    '1bddjsb0': {
      'en': '1000',
      'fr': '',
    },
    'cq0drc1g': {
      'en': 'LIME',
      'fr': '',
    },
    '19zzssft': {
      'en': 'Feed',
      'fr': '',
    },
    '1ll60djb': {
      'en': '0.1',
      'fr': '',
    },
    '6ni8ez1c': {
      'en': '\$2,100',
      'fr': '',
    },
    'bk6dhy7m': {
      'en': '300',
      'fr': '',
    },
    'pkhnjz96': {
      'en': '1000',
      'fr': '',
    },
    'hl44jv98': {
      'en': 'SALT',
      'fr': '',
    },
    'id1yched': {
      'en': 'Feed',
      'fr': '',
    },
    'd7mfgij7': {
      'en': '0.1',
      'fr': '',
    },
    'xmc3op8j': {
      'en': '\$2,100',
      'fr': '',
    },
    'urp4twtg': {
      'en': '300',
      'fr': '',
    },
    '6d21lpt9': {
      'en': '1000',
      'fr': '',
    },
    'bz8a02qs': {
      'en': 'METHIONINE',
      'fr': '',
    },
    '8kxvzef9': {
      'en': 'Feed',
      'fr': '',
    },
    'zboixpdp': {
      'en': '0.1',
      'fr': '',
    },
    '8o8mi6jh': {
      'en': '\$2,100',
      'fr': '',
    },
    'lb7yrz4k': {
      'en': '300',
      'fr': '',
    },
    'p199xpw8': {
      'en': '1000',
      'fr': '',
    },
    'itc5u0md': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    '0qq3evih': {
      'en': 'Feed',
      'fr': '',
    },
    'z9h8ey5z': {
      'en': '0.1',
      'fr': '',
    },
    '9nsnfo74': {
      'en': '\$2,100',
      'fr': '',
    },
    'kn5ajaq3': {
      'en': '300',
      'fr': '',
    },
    'ms5blq68': {
      'en': '1000',
      'fr': '',
    },
    'dlwiasa1': {
      'en': 'Feed',
      'fr': '',
    },
    'hrdkd3mi': {
      'en': 'Units',
      'fr': '',
    },
    'g3ydybiy': {
      'en': 'MAIZE',
      'fr': '',
    },
    'nfx1n7ux': {
      'en': 'FULL FAT SOYA',
      'fr': '',
    },
    'pm4nw88u': {
      'en': 'LOW FAT SOYA',
      'fr': '',
    },
    '0wziqweh': {
      'en': 'FISH MEAL',
      'fr': '',
    },
    'acnbrel1': {
      'en': 'DICALCIUM PHOSPHATE',
      'fr': '',
    },
    'hjjosil1': {
      'en': 'LIME',
      'fr': '',
    },
    'smm6sr2j': {
      'en': 'SALT',
      'fr': '',
    },
    'p33tpnt8': {
      'en': 'METHIONINE',
      'fr': '',
    },
    'wxoobzrn': {
      'en': 'BROILER VIT-MINERAL PREMIX/ Conc',
      'fr': '',
    },
    'zp9sthur': {
      'en': 'Home',
      'fr': '',
    },
  },
  // ResetPassword
  {
    'jwbxhnqf': {
      'en': 'Reset Password',
      'fr': '',
    },
    'd5ydju8i': {
      'en':
          'Please fill out your email and the password reset link will promptly sent to your email address.',
      'fr': '',
    },
    'jiez50fx': {
      'en': 'Email',
      'fr': '',
    },
    'qqyfphy0': {
      'en': 'Enter your email',
      'fr': '',
    },
    'tcipdxm8': {
      'en': 'Reset Password',
      'fr': '',
    },
    'ttfl8739': {
      'en': 'Back',
      'fr': '',
    },
  },
  // Share
  {
    '7ntcxpdz': {
      'en': 'Invite Friends',
      'fr': '',
    },
    'gbv4ik6s': {
      'en':
          'Share the app with your friends by entering their email addresses below.',
      'fr': '',
    },
    'qbx01kzo': {
      'en': 'Friend\'s Email',
      'fr': '',
    },
    'osjz2ecl': {
      'en': 'Enter email address',
      'fr': '',
    },
    'ccrvo47q': {
      'en': 'Send Invitation',
      'fr': '',
    },
  },
  // Help
  {
    'csbxmm5e': {
      'en': 'Submit Ticket',
      'fr': '',
    },
    'rlqs4b28': {
      'en': 'Welcome to support',
      'fr': '',
    },
    'ekfpinxn': {
      'en': 'Submit a Ticket',
      'fr': '',
    },
    'gi5831sn': {
      'en': 'Call Us',
      'fr': '',
    },
    'uqs0zg0i': {
      'en': 'Email Us',
      'fr': '',
    },
    'porcqvci': {
      'en': 'FAQs',
      'fr': '',
    },
    'qmywnfkn': {
      'en': 'Channel Name',
      'fr': '',
    },
    '4e8xuow2': {
      'en': 'Channel ID',
      'fr': '',
    },
    'np6mfab0': {
      'en': 'Short Description of what is going on...',
      'fr': '',
    },
    '5e4diltp': {
      'en': 'Upload Screenshot',
      'fr': '',
    },
    'ovscuafg': {
      'en': 'Submit Ticket',
      'fr': '',
    },
    'aezs0p1d': {
      'en': 'Home',
      'fr': '',
    },
  },
  // UpdateChicken
  {
    'irtyddd2': {
      'en': 'Update your data',
      'fr': '',
    },
    '2w2x9l85': {
      'en': 'Please fill out the form below to continue.',
      'fr': '',
    },
    'edki9no0': {
      'en': 'Used Currency',
      'fr': '',
    },
    'e0csutd2': {
      'en': 'Select one...',
      'fr': '',
    },
    '4ooz2f1g': {
      'en': 'Search for a currency...',
      'fr': '',
    },
    'lh18vvn4': {
      'en': 'Number of Chickens*',
      'fr': '',
    },
    'lpqn77j7': {
      'en': 'Days Old Chick*',
      'fr': '',
    },
    'iyrtv767': {
      'en': 'Grown Broilers*',
      'fr': '',
    },
    'k9nph1zp': {
      'en': 'UPDATE',
      'fr': '',
    },
    '2tyc13re': {
      'en': 'Please enter the chicken details.',
      'fr': '',
    },
    'umwbvmhe': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'o3qd5pvv': {
      'en': 'Please enter price for a day old  chick',
      'fr': '',
    },
    'jpmyjziy': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'ms9o9mrz': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'bvfg8ple': {
      'en': 'Home',
      'fr': '',
    },
  },
  // UpdateInvestment
  {
    'zfrd9umu': {
      'en': 'Update your data',
      'fr': '',
    },
    'fmhvr2ux': {
      'en': 'Please fill out the form below to continue.',
      'fr': '',
    },
    'akx64wyb': {
      'en': 'Poultry houses per square meter*',
      'fr': '',
    },
    '2fftts8c': {
      'en': 'Drinker Price*',
      'fr': '',
    },
    '57dluyty': {
      'en': 'Feeder Price*',
      'fr': '',
    },
    'zuv13mqv': {
      'en': 'Brooder Price*',
      'fr': '',
    },
    'zxf8f2hx': {
      'en': 'Infrared Lamp Price*',
      'fr': '',
    },
    'njp5xldq': {
      'en': 'Borehole Price*',
      'fr': '',
    },
    'p4cehkwk': {
      'en': 'Set of Tools Price*',
      'fr': '',
    },
    '96sd1zxq': {
      'en': 'UPDATE',
      'fr': '',
    },
    'dpo9m60l': {
      'en': 'Field is required',
      'fr': '',
    },
    '8yvcczqt': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'r2bz7ctt': {
      'en': 'Field is required',
      'fr': '',
    },
    'oq03efgg': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'el91xi5h': {
      'en': 'Field is required',
      'fr': '',
    },
    '89v7hmbd': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'uodqje2k': {
      'en': 'Field is required',
      'fr': '',
    },
    'y9xpfsdt': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '0zg1unot': {
      'en': 'Field is required',
      'fr': '',
    },
    'qs5phfoh': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'xoqbpvqw': {
      'en': 'Field is required',
      'fr': '',
    },
    '0j7y6trc': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'anv3ykt5': {
      'en': 'Field is required',
      'fr': '',
    },
    'gpf9d4fj': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '4xuwgc1y': {
      'en': 'Home',
      'fr': '',
    },
  },
  // UpdateConsumables
  {
    'vx8fsl2v': {
      'en': 'Update your data',
      'fr': '',
    },
    'l50ng6j5': {
      'en': 'Please fill out the form below to continue.',
      'fr': '',
    },
    'eydzl8ab': {
      'en': 'Vaccines and other Medications per Kg*',
      'fr': '',
    },
    'mp35fo2d': {
      'en': 'Selling Cost per Chicken*',
      'fr': '',
    },
    'z28ey2vk': {
      'en': 'Transport per Chicken*',
      'fr': '',
    },
    'if9aq8p3': {
      'en': 'Feeds Kgs per 50Kg Bag*',
      'fr': '',
    },
    '3rwy09pv': {
      'en': 'Water per Liter*',
      'fr': '',
    },
    '5071rldf': {
      'en': 'Daily Power Consumption per Chicken*',
      'fr': '',
    },
    'c2r34kfl': {
      'en': 'Litter per Chicken*',
      'fr': '',
    },
    '03115wt9': {
      'en': 'Labour per Chicken*',
      'fr': '',
    },
    'u6vv1vmw': {
      'en': 'UPDATE',
      'fr': '',
    },
    '3onczu96': {
      'en': 'Field is required',
      'fr': '',
    },
    'eyvqluzv': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'wasjm10o': {
      'en': 'Field is required',
      'fr': '',
    },
    '2ebew5kw': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'cszmlefp': {
      'en': 'Field is required',
      'fr': '',
    },
    'owmhrshl': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'oj03lci7': {
      'en': 'Field is required',
      'fr': '',
    },
    'ofdzzjyk': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'lub0oaq4': {
      'en': 'Field is required',
      'fr': '',
    },
    'moahwqb3': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'raxxbp0a': {
      'en': 'Field is required',
      'fr': '',
    },
    'g48gwuep': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'bkxr3hyd': {
      'en': 'Field is required',
      'fr': '',
    },
    'mzepfk9p': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '3s8pvuqa': {
      'en': 'Field is required',
      'fr': '',
    },
    'hwaxvrhq': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'lf7jw7ob': {
      'en': 'Home',
      'fr': '',
    },
  },
  // UpdateFeeds
  {
    'v36o16ix': {
      'en': 'Update your data',
      'fr': '',
    },
    'uf28d1py': {
      'en': 'Please fill out the form below to continue.',
      'fr': '',
    },
    'ytbbbp53': {
      'en': 'Maize per 50Kg Bag*',
      'fr': '',
    },
    'kwfppqri': {
      'en': 'Full Fat Soya per 50Kg Bag*',
      'fr': '',
    },
    'gwyjy4xr': {
      'en': 'Low Fat Soya per 50Kg Bag*',
      'fr': '',
    },
    'a2d8k07q': {
      'en': 'Fish Meal per 50Kg Bag*',
      'fr': '',
    },
    'l6dmxgro': {
      'en': 'Dicalcium Phosphate per 50Kg Bag*',
      'fr': '',
    },
    '45xmuuoq': {
      'en': 'Lime per 50Kg Bag*',
      'fr': '',
    },
    'p2epkefh': {
      'en': 'Salt per 25Kg Bag*',
      'fr': '',
    },
    '1wz6zwzt': {
      'en': 'Methionine per 1Kg Pack*',
      'fr': '',
    },
    'h7ba9zjp': {
      'en': 'BROILER VIT-MINERAL PREMIX per 1Kg Pack*',
      'fr': '',
    },
    'tus2iu8q': {
      'en': 'Concentrates per 50Kg Bag*',
      'fr': '',
    },
    'zt3u93hg': {
      'en': 'UPDATE',
      'fr': '',
    },
    'eo15vfws': {
      'en': 'Field is required',
      'fr': '',
    },
    'gnomaf63': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'hgzpvwas': {
      'en': 'Field is required',
      'fr': '',
    },
    'sls5b95v': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'eb1v0k0c': {
      'en': 'Field is required',
      'fr': '',
    },
    'rga723ey': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '7i652xyt': {
      'en': 'Field is required',
      'fr': '',
    },
    'tzbs2w7p': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'm23cek9e': {
      'en': 'Field is required',
      'fr': '',
    },
    'tw6rdk8h': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '1l8m2ch7': {
      'en': 'Field is required',
      'fr': '',
    },
    'n7lag9g6': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'ey5o8wmz': {
      'en': 'Field is required',
      'fr': '',
    },
    '7aayk6cu': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'h8k3w51m': {
      'en': 'Field is required',
      'fr': '',
    },
    'x4j82cty': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'v5y4tdw3': {
      'en': 'Field is required',
      'fr': '',
    },
    'i992crfr': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '11ejn9x7': {
      'en': 'Field is required',
      'fr': '',
    },
    '141i591g': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'hhzchj6v': {
      'en': 'Home',
      'fr': '',
    },
  },
  // PrivacyPolicy
  {
    'sgcsjlob': {
      'en': 'Privacy Policy',
      'fr': '',
    },
    '4xx2wfiw': {
      'en':
          'At Natech PoultryPro, we value the privacy and security of our users. This Privacy Policy explains how we collect, use, and disclose personal information when you use our app. By using our app, you consent to the collection, use, and disclosure of your personal information as described in this Privacy Policy.',
      'fr': '',
    },
    'u2cojxbl': {
      'en': 'Information We Collect',
      'fr': '',
    },
    'tzbi4mw5': {
      'en':
          'When you use our app, we may collect certain information from you, including:',
      'fr': '',
    },
    'h5ubovyw': {
      'en':
          '- Personal information such as your name, email address, and phone number',
      'fr': '',
    },
    'pwwkyrdn': {
      'en':
          '- Information about your poultry farm, such as the number of chickens and types of feeds used',
      'fr': '',
    },
    'yjh9m7yz': {
      'en':
          '- Usage information, such as the features you use and the actions you take in the app',
      'fr': '',
    },
    'hrw06rg8': {
      'en': 'How We Use Your Information',
      'fr': '',
    },
    '0xn3aye4': {
      'en': 'We may use the information we collect from you to:',
      'fr': '',
    },
    'k8iybca6': {
      'en': '- Provide and maintain the app\'s functionality',
      'fr': '',
    },
    'ojjk07z8': {
      'en': '- Personalize your experience and improve our app',
      'fr': '',
    },
    '671lci0v': {
      'en': '- Communicate with you and respond to your inquiries',
      'fr': '',
    },
    'jb0d74o1': {
      'en': '- Send you updates, newsletters, and marketing materials',
      'fr': '',
    },
    'rs9axuni': {
      'en': 'How We Share Your Information',
      'fr': '',
    },
    'xdrjwtr3': {
      'en':
          'We may share your information with third parties in the following circumstances:',
      'fr': '',
    },
    '22jm6htw': {
      'en': '- With your consent or at your direction',
      'fr': '',
    },
    '2cpqjztl': {
      'en': '- With service providers who help us provide and improve our app',
      'fr': '',
    },
    'iuxqmdbz': {
      'en':
          '- With law enforcement or government authorities when required by law or to protect our rights',
      'fr': '',
    },
    '3kn2wnt0': {
      'en': '- In connection with a merger, acquisition, or sale of assets',
      'fr': '',
    },
    'hpltnmyl': {
      'en': 'Data Retention',
      'fr': '',
    },
    '3cn1vzb8': {
      'en':
          'We will retain your personal information for as long as necessary to fulfill the purposes outlined in this Privacy Policy, unless a longer retention period is required or permitted by law.',
      'fr': '',
    },
    'k4c25l4b': {
      'en': 'Contact Us',
      'fr': '',
    },
    'vplfr1pu': {
      'en':
          'If you have any questions or concerns about our Privacy Policy, please contact us at poultryappacc@gmail.com.',
      'fr': '',
    },
    'e7bm33tw': {
      'en': 'Last Updated on Aug 1,2024',
      'fr': '',
    },
  },
  // Terms
  {
    't0mvojyr': {
      'en': 'Terms and Conditions',
      'fr': '',
    },
    '4ykhhmoa': {
      'en':
          'By using Natech PoultryPro, you agree to the following terms and conditions:',
      'fr': '',
    },
    '0nyekrs3': {
      'en': '1. User Responsibilities:',
      'fr': '',
    },
    'yewjygty': {
      'en':
          '- You are responsible for maintaining the accuracy and completeness of your account information.',
      'fr': '',
    },
    'inslpoga': {
      'en':
          '- You are responsible for keeping your login credentials confidential and secure.',
      'fr': '',
    },
    'issvgi3f': {
      'en':
          '- You are responsible for any activities conducted through your account.',
      'fr': '',
    },
    'bs6yxiqx': {
      'en': '2. Data Privacy and Protection:',
      'fr': '',
    },
    'nvtjkwwz': {
      'en':
          '- We collect and store your personal information in accordance with our Privacy Policy.',
      'fr': '',
    },
    '336nro6b': {
      'en':
          '- We use industry-standard security measures to protect your data.',
      'fr': '',
    },
    'oxxvkf1b': {
      'en': '3. Prohibited Activities:',
      'fr': '',
    },
    'd9hpzebf': {
      'en':
          '- You must not use this app for any illegal or unauthorized purposes.',
      'fr': '',
    },
    '4x3g1ol0': {
      'en':
          '- You must not engage in any activity that may disrupt or interfere with the functioning of the app.',
      'fr': '',
    },
    'imvdi6w4': {
      'en': '4. Liability Limitations:',
      'fr': '',
    },
    'j6d76i6n': {
      'en':
          '- We are not responsible for any damages or losses incurred as a result of using this app.',
      'fr': '',
    },
    'jrgdiy75': {
      'en':
          '- We do not guarantee the accuracy or reliability of any information provided through this app.',
      'fr': '',
    },
    'qb90jfpz': {
      'en': '5. Other Legal Considerations:',
      'fr': '',
    },
    '28toomch': {
      'en':
          '- These terms and conditions are subject to change without notice.',
      'fr': '',
    },
    'alahl3kl': {
      'en':
          '- Any disputes arising from the use of this app shall be governed by the laws of your country.',
      'fr': '',
    },
    'o4g8r8kx': {
      'en': 'Last Updated on Aug 1,2024',
      'fr': '',
    },
  },
  // HomeBckp
  {
    'n5ms2g8k': {
      'en': 'Categories',
      'fr': '',
    },
    'h80daoe6': {
      'en': 'All',
      'fr': '',
    },
    'ej9yuhmw': {
      'en': 'Starter',
      'fr': '',
    },
    'i4d1ji51': {
      'en': 'Grower',
      'fr': '',
    },
    'wksbl4sq': {
      'en': 'Finisher',
      'fr': '',
    },
    'mhpyyw2r': {
      'en': 'All',
      'fr': '',
    },
    'kxjt5z6v': {
      'en': 'Day 1 - 14',
      'fr': '',
    },
    'suo86jue': {
      'en': 'Starter',
      'fr': '',
    },
    'mxxra490': {
      'en': 'Day 14 - 42',
      'fr': '',
    },
    'bg9y8xx4': {
      'en': 'Grower',
      'fr': '',
    },
    '5rwm0szr': {
      'en': 'Day 42 - 49',
      'fr': '',
    },
    '9eiz8602': {
      'en': 'Finisher',
      'fr': '',
    },
    'xijfrj24': {
      'en': 'Number of Chickens',
      'fr': '',
    },
    'q6mrwudl': {
      'en': 'Chicken Planner',
      'fr': '',
    },
    'vlkg6jbe': {
      'en': 'Edit the price list for the capital investment.',
      'fr': '',
    },
    '9eky293r': {
      'en': 'Edit',
      'fr': '',
    },
    'gzk39akg': {
      'en': 'CAPITAL INVESTMENT TOTALS',
      'fr': '',
    },
    'vch86ii4': {
      'en': 'Poultry Houses',
      'fr': '',
    },
    'dah72wqm': {
      'en': 'Drinkers ',
      'fr': '',
    },
    '157gv57a': {
      'en': 'Feeders',
      'fr': '',
    },
    'z0ua9w5y': {
      'en': 'Brooders',
      'fr': '',
    },
    'o48kn1e4': {
      'en': 'Infrared Lamp ',
      'fr': '',
    },
    '5mfy9eo4': {
      'en': 'Borehole',
      'fr': '',
    },
    'x232agx2': {
      'en': 'Sets of tools ',
      'fr': '',
    },
    'xi5698x3': {
      'en': 'Poultry Houses',
      'fr': '',
    },
    'ifldycag': {
      'en': 'Drinkers ',
      'fr': '',
    },
    'thtu8h11': {
      'en': 'Feeders',
      'fr': '',
    },
    '48jefcco': {
      'en': 'Brooders',
      'fr': '',
    },
    'ewws04la': {
      'en': 'Infrared Lamp ',
      'fr': '',
    },
    '1203swsj': {
      'en': 'Borehole',
      'fr': '',
    },
    '98fxdeuy': {
      'en': 'Sets of tools ',
      'fr': '',
    },
    'g042neh5': {
      'en': 'CONSUMABLES',
      'fr': '',
    },
    'dw3tsi47': {
      'en': 'Edit the price list for the consumables.',
      'fr': '',
    },
    'e2mt1kr1': {
      'en': 'Edit',
      'fr': '',
    },
    'u8kzfppv': {
      'en': 'BUY ',
      'fr': '',
    },
    'agd5irqa': {
      'en': 'MAKE ',
      'fr': '',
    },
    '3i8celcg': {
      'en': 'MIXING CONCENTRATES ',
      'fr': '',
    },
    'luob5uvd': {
      'en': 'Selling cost',
      'fr': '',
    },
    '7qfud33k': {
      'en': 'BUY ',
      'fr': '',
    },
    'z3oxx0nh': {
      'en': 'MAKE ',
      'fr': '',
    },
    '8kdie3la': {
      'en': 'MIXING CONCENTRATES ',
      'fr': '',
    },
    'wh8qsx1t': {
      'en': 'Transport',
      'fr': '',
    },
    'k466xkk9': {
      'en': 'BUY ',
      'fr': '',
    },
    'n05init0': {
      'en': 'MAKE ',
      'fr': '',
    },
    '9fd30pa9': {
      'en': 'MIXING CONCENTRATES ',
      'fr': '',
    },
    'xega8zrb': {
      'en': 'BUY ',
      'fr': '',
    },
    'vqp48a4w': {
      'en': 'MAKE ',
      'fr': '',
    },
    'ef1qe19k': {
      'en': 'MIXING CONCENTRATES ',
      'fr': '',
    },
    'ie8d5tjg': {
      'en': 'BUY ',
      'fr': '',
    },
    'h6gwm2hq': {
      'en': 'MAKE ',
      'fr': '',
    },
    'a24aiidl': {
      'en': 'MIXING CONCENTRATES ',
      'fr': '',
    },
    'sb9cbl0a': {
      'en': 'Power Consumption',
      'fr': '',
    },
    'emh5gckj': {
      'en': 'BUY ',
      'fr': '',
    },
    'ugv80pdz': {
      'en': 'MAKE ',
      'fr': '',
    },
    '923uqsq0': {
      'en': 'MIXING CONCENTRATES ',
      'fr': '',
    },
    '6jmxb8al': {
      'en': 'Litter',
      'fr': '',
    },
    'f8rumpn0': {
      'en': 'BUY ',
      'fr': '',
    },
    'zkk1how8': {
      'en': 'MAKE ',
      'fr': '',
    },
    'ycakkdnq': {
      'en': 'MIXING CONCENTRATES ',
      'fr': '',
    },
    '1ylemqba': {
      'en': 'Labour',
      'fr': '',
    },
    '74nn008t': {
      'en': 'BUY ',
      'fr': '',
    },
    '40q1rype': {
      'en': 'MAKE ',
      'fr': '',
    },
    'scn5j5wp': {
      'en': 'MIXING CONCENTRATES ',
      'fr': '',
    },
    '0iu0c6wu': {
      'en': 'Your Account',
      'fr': '',
    },
    's6j2vph1': {
      'en': 'Edit Profile',
      'fr': '',
    },
    'm8s4uvhf': {
      'en': 'Subscription Plan',
      'fr': '',
    },
    '1t4wtxc7': {
      'en': 'App Navigation',
      'fr': '',
    },
    'ikoa39hh': {
      'en': 'Settings',
      'fr': '',
    },
    'efd3ko7p': {
      'en': 'Overview',
      'fr': '',
    },
    'uxgdgtin': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'y6k82x2m': {
      'en': 'Do you want that this application  access the phone camera',
      'fr': '',
    },
    'n8eztxi3': {
      'en': 'Do you want that this application  access the phone gallery',
      'fr': '',
    },
    'gj2i92xk': {
      'en': 'Do you want that this application  access the biometrics',
      'fr': '',
    },
    'y65sr2bt': {
      'en': 'Do you want that this application  access the bluetooth',
      'fr': '',
    },
    'xy9rl8kr': {
      'en': 'Do you want that this application  access the camera',
      'fr': '',
    },
    'swdkx2pe': {
      'en': 'Do you want that this application  access the location',
      'fr': '',
    },
    '006n3x9v': {
      'en': 'Do you want that this application  access the phone contacts',
      'fr': '',
    },
    'ixfyvxcz': {
      'en': 'Do you want that this application  access the microphone',
      'fr': '',
    },
    'z85kn2fe': {
      'en': 'Do you want that this application  access the notifications',
      'fr': '',
    },
    'q41jvw4f': {
      'en': '',
      'fr': '',
    },
    '0o7vc22f': {
      'en': '',
      'fr': '',
    },
    'k9f72t73': {
      'en': '',
      'fr': '',
    },
    '63yam0il': {
      'en': '',
      'fr': '',
    },
    'ana8t2co': {
      'en': '',
      'fr': '',
    },
    'lualhecu': {
      'en': '',
      'fr': '',
    },
    'ubmkh4h0': {
      'en': '',
      'fr': '',
    },
    '7o5e04kk': {
      'en': '',
      'fr': '',
    },
    'fddsidwu': {
      'en': '',
      'fr': '',
    },
    'bg9owcn3': {
      'en': '',
      'fr': '',
    },
    'ulnsaq2k': {
      'en': '',
      'fr': '',
    },
    '6nde3eyr': {
      'en': '',
      'fr': '',
    },
    'm4g3m9oq': {
      'en': '',
      'fr': '',
    },
    'srv64s7e': {
      'en': '',
      'fr': '',
    },
    'ial3szo2': {
      'en': '',
      'fr': '',
    },
    'yao8bhvi': {
      'en': '',
      'fr': '',
    },
    '71l9i7ld': {
      'en': '',
      'fr': '',
    },
    'f5fhihzs': {
      'en': '',
      'fr': '',
    },
    'hvbk3ilr': {
      'en': '',
      'fr': '',
    },
    'jl2b1q9k': {
      'en': '',
      'fr': '',
    },
    '3exarv1x': {
      'en': '',
      'fr': '',
    },
    'ap6q10xn': {
      'en': '',
      'fr': '',
    },
    'vvv0irdb': {
      'en': '',
      'fr': '',
    },
    'z01drooa': {
      'en': '',
      'fr': '',
    },
    'qpv03awj': {
      'en': '',
      'fr': '',
    },
  },
  //Management
  {
'w6zqmj7g':{
  'en':'Natech PoultryPro',
},
'tn5mczkg':{
  'en': 'Frequently Asked Questions',
}, 
'j6laf6ec':{
  'en': 'What are the factors affecting broiler chicken production costs?',
}, 
'spcfx73b':{
  'en': 'Expand to check the answer',
}, 
'mcoo8awz':{
  'en': 'Factors that affect broiler chicken production costs include feed prices, labor costs, energy costs, and the cost of medications and vaccines. Feed prices can have a significant impact on overall production costs as feed typically accounts for the largest expense in raising broiler chickens. Labor costs, including wages and benefits for farm workers, also play a role in determining production costs. Energy costs, such as electricity and heating, are necessary to maintain suitable conditions in broiler houses, and fluctuations in energy prices can affect production costs. Additionally, the cost of medications and vaccines to prevent and treat diseases in broiler chickens is another important factor to consider when calculating production costs.',
}, 
'b1hbjuj9':{
  'en': 'How do feed prices impact broiler chicken production costs?',
}, 
'5ddav2si':{
  'en': 'Expand to check the answer',
}, 
'8r3vlw4u':{
  'en': 'Feed prices have a substantial impact on broiler chicken production costs. Feed typically accounts for the largest expense in raising broiler chickens, making up around 70% of the total production costs. Fluctuations in feed prices, which are influenced by factors such as weather conditions, crop yields, and global demand, can significantly affect the profitability of broiler chicken production. When feed prices increase, producers may face higher production costs, which can reduce profit margins. Conversely, lower feed prices can lead to reduced production costs, allowing producers to potentially increase their profit margins. Therefore, closely monitoring and managing feed prices is crucial for maximizing profitability in broiler chicken production.',
}, 
  },
].reduce((a, b) => a..addAll(b));
