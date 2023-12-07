import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans', 'zh_Hant'];

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
    String? zh_HansText = '',
    String? zh_HantText = '',
  }) =>
      [enText, zh_HansText, zh_HantText][languageIndex] ?? '';

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
  // HOMEPAGE
  {
    '9fakqsse': {
      'en': '\nIntroducing a festive collaboration with \nSuna Fujita',
      'zh_Hans': '推出节庆合作\n藤田沙奈',
      'zh_Hant': '推出節慶合作\n藤田沙奈',
    },
    'lj3ata0z': {
      'en': '          SS24 \nPRECOLLECTION',
      'zh_Hans': 'SS24\n预收',
      'zh_Hant': 'SS24\n預收',
    },
    'cvwces0c': {
      'en': 'Women',
      'zh_Hans': '女性',
      'zh_Hant': '女性',
    },
    'd2iv5rck': {
      'en': 'Men',
      'zh_Hans': '男士',
      'zh_Hant': '男士',
    },
    'kfd7d5mq': {
      'en': 'Discover the collection',
      'zh_Hans': '探索该系列',
      'zh_Hant': '探索該系列',
    },
    'b7m3st78': {
      'en': 'Characterful additions',
      'zh_Hans': '特色添加',
      'zh_Hant': '特色添加',
    },
    'fjla012m': {
      'en':
          'Japanese ceramic studio Suna Fujita \nanimates SS24 precollection ready-to-wear, \nbags, and accessories, alongside the new \nseason’s statement pieces and \neveryday essentials.',
      'zh_Hans':
          '日本陶瓷工作室Suna Fujita\n为 SS24 早春成衣注入活力，\n包袋、配饰以及新品\n本季的宣言单品和\n日常必需品。',
      'zh_Hant':
          '日本陶瓷工作室Suna Fujita\n為 SS24 早春成衣注入活力，\n包款、配件以及新品\n本季的宣言單品和\n日常必需品。',
    },
    '9zsljd72': {
      'en': 'Bags',
      'zh_Hans': '包',
      'zh_Hant': '包',
    },
    'awnaibnw': {
      'en': 'Womenswear',
      'zh_Hans': '女装',
      'zh_Hant': '女裝',
    },
    'agtnmc8h': {
      'en': 'Shoes',
      'zh_Hans': '鞋',
      'zh_Hant': '鞋',
    },
    'wo0trukz': {
      'en': 'The LOEWE gift guide is here',
      'zh_Hans': 'LOEWE罗意威礼品指南就在这里',
      'zh_Hant': 'LOEWE羅意威禮物指南就在這裡',
    },
    'rejrrv5w': {
      'en': 'HOLIDAYS 2023',
      'zh_Hans': '2023 年假期',
      'zh_Hant': '2023 年假期',
    },
    'yqdarub7': {
      'en': 'Gifting selection',
      'zh_Hans': '送礼精选',
      'zh_Hant': '送禮精選',
    },
    'lvtk6mj5': {
      'en': 'Gifts for her',
      'zh_Hans': '给她的礼物',
      'zh_Hant': '給她的禮物',
    },
    '59pje6u0': {
      'en': 'Gifts for him',
      'zh_Hans': '给他的礼物',
      'zh_Hant': '給他的禮物',
    },
    'ofvdjix1': {
      'en': 'Gift a little something great',
      'zh_Hans': '赠送一些很棒的东西',
      'zh_Hant': '贈送一些很棒的東西',
    },
    '4prg0m3j': {
      'en':
          'Small-scale gifts and stocking fillers, from \nhandcrafted wallets to playful charms.',
      'zh_Hans': '小型礼品和圣诞袜填充物，来自\n手工制作的钱包充满俏皮魅力。',
      'zh_Hant': '小型禮品和聖誕襪填充物，來自\n手工製作的皮夾充滿俏皮魅力。',
    },
    'yrwnxfhy': {
      'en': 'Explore the \nselection',
      'zh_Hans': '探索\n选择',
      'zh_Hant': '探索\n選擇',
    },
    'xtld0kte': {
      'en': 'Small leather \ngoods',
      'zh_Hans': '小皮革\n商品',
      'zh_Hant': '小皮革\n商品',
    },
    '382ynwzt': {
      'en': 'Accessories',
      'zh_Hans': '配件',
      'zh_Hant': '配件',
    },
    'dv01voz1': {
      'en': 'Explore all',
      'zh_Hans': '探索全部',
      'zh_Hant': '探索全部',
    },
    '1fa1c8of': {
      'en': 'Holiday packaging',
      'zh_Hans': '节日包装',
      'zh_Hant': '節日包裝',
    },
    '8yp2yspb': {
      'en': 'Explore',
      'zh_Hans': '探索',
      'zh_Hant': '探索',
    },
    '5365p354': {
      'en': 'Holiday services',
      'zh_Hans': '假期服务',
      'zh_Hant': '假期服務',
    },
    'bmvya2la': {
      'en': 'Explore',
      'zh_Hans': '探索',
      'zh_Hant': '探索',
    },
    'scjkc43n': {
      'en': 'Become part of the LOEWE community',
      'zh_Hans': '成为 LOEWE 社区的一部分',
      'zh_Hant': '成為 LOEWE 社區的一部分',
    },
    'zv93fyn5': {
      'en':
          'Receive first access to the very best of LOEWE \nproducts, inspiration and services.  ',
      'zh_Hans': '抢先体验 LOEWE 最好的产品\n产品、灵感和服务。',
      'zh_Hant': '搶先體驗 LOEWE 最好的產品\n產品、靈感和服務。',
    },
    'hangehix': {
      'en': ' See more',
      'zh_Hans': '查看更多',
      'zh_Hant': '看更多',
    },
    'xs719lnv': {
      'en': 'Man*',
      'zh_Hans': '男人*',
      'zh_Hant': '男人*',
    },
    'qrmmiguh': {
      'en': 'Woman*',
      'zh_Hans': '女士*',
      'zh_Hant': '女士*',
    },
    'vabkghwa': {
      'en': 'Non Binary*',
      'zh_Hans': '非二进制*',
      'zh_Hant': '非二進位*',
    },
    'ivdc3k9c': {
      'en': 'Prefer not to Say*',
      'zh_Hans': '不想说*',
      'zh_Hant': '不想說*',
    },
    'xmoz7jo9': {
      'en': 'Email address*',
      'zh_Hans': '电子邮件地址*',
      'zh_Hant': '電子郵件地址*',
    },
    '86cveiwm': {
      'en': 'OK',
      'zh_Hans': '好的',
      'zh_Hant': '好的',
    },
    '759f7a3v': {
      'en': 'Client Services',
      'zh_Hans': '客户服务',
      'zh_Hant': '客戶服務',
    },
    'yyx6amri': {
      'en': 'Care guide',
      'zh_Hans': '护理指南',
      'zh_Hant': '護理指南',
    },
    'q91xdv13': {
      'en': 'Sitemap',
      'zh_Hans': '网站地图',
      'zh_Hant': '網站地圖',
    },
    't579bv78': {
      'en': 'Sustainability',
      'zh_Hans': '可持续发展',
      'zh_Hant': '永續發展',
    },
    'ipcanksa': {
      'en': 'Store Finder',
      'zh_Hans': '商店查找器',
      'zh_Hant': '商店查找器',
    },
    '7190v3qr': {
      'en': 'Careers',
      'zh_Hans': '职业机会',
      'zh_Hant': '職業機會',
    },
    'nfq08351': {
      'en': 'Book an appointment',
      'zh_Hans': '预约',
      'zh_Hant': '預約',
    },
    'xfb9c612': {
      'en': 'Terms & conditions',
      'zh_Hans': '条款和条件',
      'zh_Hant': '條款與條件',
    },
    'n07j7jlp': {
      'en': 'Shipping & returns',
      'zh_Hans': '运输和退货',
      'zh_Hant': '運輸和退貨',
    },
    's2ykzwn2': {
      'en': 'Privacy and cookies policy',
      'zh_Hans': '隐私和cookies政策',
      'zh_Hant': '隱私權和cookies政策',
    },
    '5mfib9qy': {
      'en': 'Our packaging',
      'zh_Hans': '我们的包装',
      'zh_Hant': '我們的包裝',
    },
    'b9nc05ey': {
      'en': 'United Kingdom',
      'zh_Hans': '英国',
      'zh_Hant': '英國',
    },
    'yyf4ullw': {
      'en': '-',
      'zh_Hans': '-',
      'zh_Hant': '-',
    },
    'ox7jrdyp': {
      'en': 'English',
      'zh_Hans': '英语',
      'zh_Hant': '英語',
    },
    'z300fmhp': {
      'en': 'Facebook',
      'zh_Hans': 'Facebook',
      'zh_Hant': 'Facebook',
    },
    '4jq7oys4': {
      'en': 'Instagram',
      'zh_Hans': 'Instagram',
      'zh_Hant': 'Instagram',
    },
    'kztbqara': {
      'en': 'Twitter',
      'zh_Hans': 'Twitter',
      'zh_Hant': 'Twitter',
    },
    'c1zq7hbo': {
      'en': 'Youtube',
      'zh_Hans': 'Youtube',
      'zh_Hant': 'Youtube',
    },
    'ccc63vcp': {
      'en': 'Pinterest',
      'zh_Hans': 'Pinterest',
      'zh_Hant': 'Pinterest',
    },
    'fubqqj5b': {
      'en': 'WOMEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wbzfltp4': {
      'en': 'MEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'slzo38bq': {
      'en': 'SS24 COLLECTION',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bopsoaqj': {
      'en': 'GIFTS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ppn21ax5': {
      'en': 'CRAFT',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9txqdmxm': {
      'en': 'STORIES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'agaxulyk': {
      'en': 'My account',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '59uthu8u': {
      'en': 'Stores',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'r1ygj44d': {
      'en': 'Shipping to United Kingdom - English',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ex95twev': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'c8a6npak': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '84obqm6y': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jhcs371w': {
      'en': 'Free shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ztpasnjn': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'iiz5srhp': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // Explorethecollection
  {
    'w4z7czlj': {
      'en': 'Gift a little something great',
      'zh_Hans': '赠送一些很棒的东西',
      'zh_Hant': '贈送一些很棒的東西',
    },
    '9cnewn57': {
      'en':
          'Discover our edit of gift ideas, from design \nclassics to joyful accessories to make your loved \nones smile.',
      'zh_Hans': '从设计中探索我们的礼品创意编辑\n经典到令人愉悦的配饰，让您心爱不已\n那些微笑。',
      'zh_Hant': '從設計中探索我們的禮物創意編輯\n經典到令人愉悅的配件，讓您心愛不已\n那些微笑。',
    },
    'uph9d95x': {
      'en': 'Gift a smile',
      'zh_Hans': '赠送微笑',
      'zh_Hant': '贈送微笑',
    },
    'z4b2d41v': {
      'en':
          'Charming characters and handcrafted details \ncombine in whimsical accessories and \nmeticulously constructed wallets designed with \nceramics studio Suna Fujita.',
      'zh_Hans': '迷人的角色和手工制作的细节\n结合异想天开的配件和\n精心构造的钱包设计\n藤田砂奈陶瓷工作室。',
      'zh_Hant': '迷人的角色和手工製作的細節\n結合異想天開的配件和\n精心建構的皮夾設計\n藤田砂奈陶瓷工作室。',
    },
    'kmw9l1qa': {
      'en': 'Bags',
      'zh_Hans': '包',
      'zh_Hant': '包',
    },
    'q7cwjz91': {
      'en': 'Wallets & small leather goods',
      'zh_Hans': '錢包和小皮具',
      'zh_Hant': '钱包和小皮具',
    },
    'hae4fple': {
      'en': 'Charms',
      'zh_Hans': '护身符',
      'zh_Hant': '護身符',
    },
    'irvygmho': {
      'en': 'Gift essentials',
      'zh_Hans': '送礼必备品',
      'zh_Hant': '送禮必備品',
    },
    'm6mwx6gj': {
      'en':
          'Timeless and functional accessories including \ncosy scarves, beautifully crafted wallets, belts and \nsneakers with a LOEWE twist.',
      'zh_Hans': '永恒且实用的配件包括\n舒适的围巾、制作精美的钱包、腰带和\n带有 LOEWE 风格的运动鞋。',
      'zh_Hant': '永恆且實用的配件包括\n舒適的圍巾、精心製作的皮夾、腰帶和\n帶有 LOEWE 風格的運動鞋。',
    },
    'rrsu0jcv': {
      'en': 'Accessories',
      'zh_Hans': '配件',
      'zh_Hant': '配件',
    },
    'bnmadoh5': {
      'en': 'Wallets',
      'zh_Hans': '钱包',
      'zh_Hant': '錢包',
    },
    'gvwfzzdm': {
      'en': 'Sneakers',
      'zh_Hans': '运动鞋',
      'zh_Hant': '運動鞋',
    },
    'kgm7ltel': {
      'en': 'Gift colour',
      'zh_Hans': '礼品颜色',
      'zh_Hant': '禮品顏色',
    },
    '4qy9eq5j': {
      'en':
          'Spread seasonal joy with uplifting gifts in rich \ncolour. Choose from handcrafted wallets, \npouches and accessories in leather to inflated \nsunglasses and sumptuous scarves.',
      'zh_Hans': '用丰富的令人振奋的礼物传播季节的欢乐\n颜色。 选择手工制作的钱包，\n充气皮革袋和配件\n太阳镜和华丽的围巾。',
      'zh_Hant': '用豐富的令人振奮的禮物傳播季節的歡樂\n顏色。 選擇手工製作的皮夾，\n充氣皮革袋和配件\n太陽眼鏡和華麗的圍巾。',
    },
    'ud0uttxm': {
      'en': 'Scarves',
      'zh_Hans': '围巾',
      'zh_Hant': '圍巾',
    },
    'svtp4wyc': {
      'en': 'Accessories',
      'zh_Hans': '配件',
      'zh_Hant': '配件',
    },
    '70pst546': {
      'en': 'Wallets',
      'zh_Hans': '钱包',
      'zh_Hant': '錢包',
    },
    'n4tlqhqt': {
      'en': 'Gift craft and design',
      'zh_Hans': '礼品工艺与设计',
      'zh_Hant': '禮品工藝與設計',
    },
    'b3pm7d2h': {
      'en':
          'Classic and enduring designs for the home, from \ncolourful candles and blankets to indulgent \naccessories in leather.',
      'zh_Hans': '经典而持久的家居设计，来自\n色彩缤纷的蜡烛和毯子让您尽情享受\n皮革配饰。',
      'zh_Hant': '經典而持久的家居設計，來自\n色彩繽紛的蠟燭和毛毯讓您盡情享受\n皮革配件。',
    },
    'm0wcd6cg': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
    'rscnvxrq': {
      'en': 'Candles',
      'zh_Hans': '蜡烛',
      'zh_Hant': '蠟燭',
    },
    'jkcpgc1j': {
      'en': 'Gift sparkle',
      'zh_Hans': '礼物闪闪发光',
      'zh_Hant': '禮物閃閃發光',
    },
    'j7n7n30o': {
      'en':
          'Celebrate the holidays with sparkle. Gift yourself \nor a friend glitter-embellished pumps for party \nnights or crystal-studded sunglasses in a range of \ncolours.',
      'zh_Hans': '用闪闪发光的方式庆祝节日。 送给自己的礼物\n或者朋友的派对用亮片装饰高跟鞋\n夜晚或镶有水晶的太阳镜\n颜色。',
      'zh_Hant': '用閃閃發光的方式慶祝節日。 送給自己的禮物\n或朋友的派對用亮片裝飾高跟鞋\n夜晚或鑲有水晶的太陽眼鏡\n顏色。',
    },
    'o72e8wu3': {
      'en': 'Sunglasses',
      'zh_Hans': '太阳镜',
      'zh_Hant': '太陽眼鏡',
    },
    '6w69jhh4': {
      'en': 'Shoes',
      'zh_Hans': '鞋',
      'zh_Hant': '鞋',
    },
    '1w4q8ofw': {
      'en': 'Holiday shopping services',
      'zh_Hans': '假日购物服务',
      'zh_Hant': '假日購物服務',
    },
    '5icd0wib': {
      'en':
          'Find out about our holiday shopping services \nand discover this year’s festive packaging, \nfeaturing artwork by Suna Fujita.',
      'zh_Hans': '了解我们的假日购物服务\n并探索今年的节日包装，\n收录有藤田砂奈 (Suna Fujita) 的作品。',
      'zh_Hant': '了解我們的假日購物服務\n並探索今年的節慶包裝，\n收錄有藤田砂奈 (Suna Fujita) 的作品。',
    },
    'ipm8h48f': {
      'en': 'Holiday \npackaging',
      'zh_Hans': '节日包装',
      'zh_Hant': '節日包裝',
    },
    '0uztkm3d': {
      'en': 'Explore\nmore',
      'zh_Hans': '探索\n更多的',
      'zh_Hant': '探索\n更多的',
    },
    'gykexzcy': {
      'en': 'Holiday se',
      'zh_Hans': '假期服务',
      'zh_Hant': '假期服務',
    },
    'xwpi5hhx': {
      'en': 'Become part of the LOEWE community',
      'zh_Hans': '成为 LOEWE 社区的一部分',
      'zh_Hant': '成為 LOEWE 社區的一部分',
    },
    'bqfksxrc': {
      'en':
          'Receive first access to the very best of LOEWE \nproducts, inspiration and services.  ',
      'zh_Hans': '抢先体验 LOEWE 最好的产品\n产品、灵感和服务。',
      'zh_Hant': '搶先體驗 LOEWE 最好的產品\n產品、靈感和服務。',
    },
    '5pqmo7sm': {
      'en': ' See more',
      'zh_Hans': '查看更多',
      'zh_Hant': '看更多',
    },
    't5t4lt14': {
      'en': 'Man*',
      'zh_Hans': '男人*',
      'zh_Hant': '男人*',
    },
    '1g1sfshu': {
      'en': 'Woman*',
      'zh_Hans': '女士*',
      'zh_Hant': '女士*',
    },
    'wkeyjsiq': {
      'en': 'Non Binary*',
      'zh_Hans': '非二进制*',
      'zh_Hant': '非二進位*',
    },
    '5jtah7fs': {
      'en': 'Prefer not to Say*',
      'zh_Hans': '不想说*',
      'zh_Hant': '不想說*',
    },
    'cc3z8qpj': {
      'en': 'Email address*',
      'zh_Hans': '电子邮件地址*',
      'zh_Hant': '電子郵件地址*',
    },
    'tmkp7l3a': {
      'en': 'OK',
      'zh_Hans': '好的',
      'zh_Hant': '好的',
    },
    'uk5x3drr': {
      'en': 'Client Services',
      'zh_Hans': '客户服务',
      'zh_Hant': '客戶服務',
    },
    '14pkr4f8': {
      'en': 'Care guide',
      'zh_Hans': '护理指南',
      'zh_Hant': '護理指南',
    },
    '04ojoa5c': {
      'en': 'Sitemap',
      'zh_Hans': '网站地图',
      'zh_Hant': '網站地圖',
    },
    '1uxvywjf': {
      'en': 'Sustainability',
      'zh_Hans': '可持续发展',
      'zh_Hant': '永續發展',
    },
    'v5cue4hx': {
      'en': 'Store Finder',
      'zh_Hans': '商店查找器',
      'zh_Hant': '商店查找器',
    },
    'pxlack5o': {
      'en': 'Careers',
      'zh_Hans': '职业机会',
      'zh_Hant': '職業機會',
    },
    'cmjppy17': {
      'en': 'Book an appointment',
      'zh_Hans': '预约',
      'zh_Hant': '預約',
    },
    '86n4wzco': {
      'en': 'Terms & conditions',
      'zh_Hans': '条款和条件',
      'zh_Hant': '條款與條件',
    },
    'xktctdo0': {
      'en': 'Shipping & returns',
      'zh_Hans': '运输和退货',
      'zh_Hant': '運輸和退貨',
    },
    'r845rk1r': {
      'en': 'Privacy and cookies policy',
      'zh_Hans': '隐私和cookies政策',
      'zh_Hant': '隱私權和cookies政策',
    },
    'xnj1v5zi': {
      'en': 'Our packaging',
      'zh_Hans': '我们的包装',
      'zh_Hant': '我們的包裝',
    },
    'sqvvvee8': {
      'en': 'United Kingdom',
      'zh_Hans': '英国',
      'zh_Hant': '英國',
    },
    'odfn8z6p': {
      'en': '-',
      'zh_Hans': '-',
      'zh_Hant': '-',
    },
    'q8js9zqs': {
      'en': 'English',
      'zh_Hans': '英语',
      'zh_Hant': '英語',
    },
    'n60wnivg': {
      'en': 'Facebook',
      'zh_Hans': 'Facebook',
      'zh_Hant': 'Facebook',
    },
    '90u0htf8': {
      'en': 'Instagram',
      'zh_Hans': 'Instagram',
      'zh_Hant': 'Instagram',
    },
    'ycpjrqa2': {
      'en': 'Twitter',
      'zh_Hans': 'Twitter',
      'zh_Hant': 'Twitter',
    },
    '7w6vsxde': {
      'en': 'Youtube',
      'zh_Hans': 'Youtube',
      'zh_Hant': 'Youtube',
    },
    '6tfpoa66': {
      'en': 'Pinterest',
      'zh_Hans': 'Pinterest',
      'zh_Hant': 'Pinterest',
    },
    'ua1zw8ms': {
      'en': 'WOMEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qv5ycr7k': {
      'en': 'MEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vda59qfy': {
      'en': 'SS24 COLLECTION',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'o8eok75l': {
      'en': 'GIFTS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'cxenz0li': {
      'en': 'CRAFT',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jn6r2c4d': {
      'en': 'STORIES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'gu5szsv7': {
      'en': 'My account',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'p57s4r17': {
      'en': 'Stores',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5zgmbmnn': {
      'en': 'Shipping to United Kingdom - English',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jik4p1xh': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'lkjk1qwd': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qgjc4kkg': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'p7t9a0f4': {
      'en': 'Free shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xeboy4iq': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'sog0zezp': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // Holidaypackaging
  {
    'lulymaoc': {
      'en': 'Holiday packaging',
      'zh_Hans': '节日包装',
      'zh_Hant': '節日包裝',
    },
    'vwpl9olr': {
      'en':
          'A menagerie of animals and plants by \nJapanese ceramic studio Suna Fujita \nanimate our festive packaging, creating \nplayful moments across boxes, bags, tissue \npaper, ribbons, and paper tags for in-store \npurchases and loewe.com orders.',
      'zh_Hans':
          '动物和植物的动物园\n日本陶瓷工作室Suna Fujita\n使我们的节日包装充满活力，创造\n跨越盒子、袋子、纸巾的俏皮时刻\n店内用纸、丝带和纸质标签\n购买和 loewe.com 订单。',
      'zh_Hant':
          '動物和植物的動物園\n日本陶瓷工作室Suna Fujita\n讓我們的節日包裝充滿活力，創造\n跨越盒子、袋子、紙巾的俏皮時刻\n店內用紙、緞帶和紙標籤\n購買和 loewe.com 訂單。',
    },
    'g8ad9cu4': {
      'en': 'Download LOEWE x Suna Fujita wallpaper',
      'zh_Hans': '下载LOEWE x 藤田沙奈壁纸',
      'zh_Hant': '下載LOEWE x 藤田沙奈壁紙',
    },
    'claff9ut': {
      'en': 'Holiday services',
      'zh_Hans': '假期服务',
      'zh_Hant': '假期服務',
    },
    '6mhgsmob': {
      'en':
          'Discover a range of seasonal services and \ninformation designed to help you find the \nperfect gifts and make your holiday \nshopping experience as smooth as \npossible.',
      'zh_Hans': '探索一系列季节性服务和\n旨在帮助您找到的信息\n完美的礼物，让您的假期更加美好\n购物体验如\n可能的。',
      'zh_Hant': '探索一系列季節性服務和\n旨在幫助您找到的信息\n完美的禮物，讓您的假期更加美好\n購物體驗如\n可能的。',
    },
    'ruazajkb': {
      'en': 'Last delivery day',
      'zh_Hans': '最后交货日',
      'zh_Hant': '最後交貨日',
    },
    'w814bnbv': {
      'en':
          'Please complete your purchase \nbefore 19th December at 3pm \nGMT+1 to receive your order in \ntime for Christmas.',
      'zh_Hans': '请完成您的购买\n12月19日下午3点前\nGMT+1 接收订单的时间\n圣诞节的时间到了。',
      'zh_Hant': '請完成您的購買\n12月19日下午3點前\nGMT+1 接收訂單的時間\n聖誕節的時間到了。',
    },
    '3g4m21e9': {
      'en': 'Holiday gifts',
      'zh_Hans': '节日礼物',
      'zh_Hant': '節日禮物',
    },
    'htcq5xju': {
      'en':
          'Uplifting colour, seasonal sparkle, and the timeless \nmagic of craft.',
      'zh_Hans': '令人振奋的色彩、季节性的光芒和永恒的魅力\n工艺的魔力。',
      'zh_Hant': '令人振奮的色彩、季節性的光芒和永恆的魅力\n工藝的魔力。',
    },
    'ktvvgtr8': {
      'en': 'Gifts for her',
      'zh_Hans': '给她的礼物',
      'zh_Hant': '給她的禮物',
    },
    'ish2qkp2': {
      'en': 'Explore',
      'zh_Hans': '探索',
      'zh_Hant': '探索',
    },
    'kecl4hw1': {
      'en': 'Gifts for him',
      'zh_Hans': '给他的礼物',
      'zh_Hant': '給他的禮物',
    },
    '0zih886p': {
      'en': 'Become part of the LOEWE community',
      'zh_Hans': '成为 LOEWE 社区的一部分',
      'zh_Hant': '成為 LOEWE 社區的一部分',
    },
    '48boa0gc': {
      'en':
          'Receive first access to the very best of LOEWE \nproducts, inspiration and services.  ',
      'zh_Hans': '抢先体验 LOEWE 最好的产品\n产品、灵感和服务。',
      'zh_Hant': '搶先體驗 LOEWE 最好的產品\n產品、靈感和服務。',
    },
    'ss0ral2x': {
      'en': ' See more',
      'zh_Hans': '查看更多',
      'zh_Hant': '看更多',
    },
    '68fcav0w': {
      'en': 'Man*',
      'zh_Hans': '男人*',
      'zh_Hant': '男人*',
    },
    'yzrmqhz0': {
      'en': 'Woman*',
      'zh_Hans': '女士*',
      'zh_Hant': '女士*',
    },
    'j9mbmifs': {
      'en': 'Non Binary*',
      'zh_Hans': '非二进制*',
      'zh_Hant': '非二進位*',
    },
    'skwaywqf': {
      'en': 'Prefer not to Say*',
      'zh_Hans': '不想说*',
      'zh_Hant': '不想說*',
    },
    'zut8c6q9': {
      'en': 'Email address*',
      'zh_Hans': '电子邮件地址*',
      'zh_Hant': '電子郵件地址*',
    },
    '02o12o3u': {
      'en': 'OK',
      'zh_Hans': '好的',
      'zh_Hant': '好的',
    },
    'u1we6bba': {
      'en': 'Client Services',
      'zh_Hans': '客户服务',
      'zh_Hant': '客戶服務',
    },
    'ef7fj6ko': {
      'en': 'Care guide',
      'zh_Hans': '护理指南',
      'zh_Hant': '護理指南',
    },
    '8usg2yyj': {
      'en': 'Sitemap',
      'zh_Hans': '网站地图',
      'zh_Hant': '網站地圖',
    },
    'fgx0cli8': {
      'en': 'Sustainability',
      'zh_Hans': '可持续发展',
      'zh_Hant': '永續發展',
    },
    'eyavp6jn': {
      'en': 'Store Finder',
      'zh_Hans': '商店查找器',
      'zh_Hant': '商店查找器',
    },
    'gaqr47mg': {
      'en': 'Careers',
      'zh_Hans': '职业机会',
      'zh_Hant': '職業機會',
    },
    '7pxq7xfs': {
      'en': 'Book an appointment',
      'zh_Hans': '预约',
      'zh_Hant': '預約',
    },
    '1vyomk6d': {
      'en': 'Terms & conditions',
      'zh_Hans': '条款和条件',
      'zh_Hant': '條款與條件',
    },
    'shiqsdch': {
      'en': 'Shipping & returns',
      'zh_Hans': '运输和退货',
      'zh_Hant': '運輸和退貨',
    },
    'an7bvn4i': {
      'en': 'Privacy and cookies policy',
      'zh_Hans': '隐私和cookies政策',
      'zh_Hant': '隱私權和cookies政策',
    },
    '44k4jy0j': {
      'en': 'Our packaging',
      'zh_Hans': '我们的包装',
      'zh_Hant': '我們的包裝',
    },
    'ga62naw7': {
      'en': 'United Kingdom',
      'zh_Hans': '英国',
      'zh_Hant': '英國',
    },
    '4mtda5sj': {
      'en': '-',
      'zh_Hans': '-',
      'zh_Hant': '-',
    },
    'm0ecd0hv': {
      'en': 'English',
      'zh_Hans': '英语',
      'zh_Hant': '英語',
    },
    '6l0w6jig': {
      'en': 'Facebook',
      'zh_Hans': 'Facebook',
      'zh_Hant': 'Facebook',
    },
    'ylvdpm7n': {
      'en': 'Instagram',
      'zh_Hans': 'Instagram',
      'zh_Hant': 'Instagram',
    },
    'fls57fbh': {
      'en': 'Twitter',
      'zh_Hans': 'Twitter',
      'zh_Hant': 'Twitter',
    },
    'vseg4a94': {
      'en': 'Youtube',
      'zh_Hans': 'Youtube',
      'zh_Hant': 'Youtube',
    },
    'nvefljlk': {
      'en': 'Pinterest',
      'zh_Hans': 'Pinterest',
      'zh_Hant': 'Pinterest',
    },
    '3ndu501h': {
      'en': 'WOMEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9hgyrpl1': {
      'en': 'MEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '91ix99lv': {
      'en': 'SS24 COLLECTION',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '78h3xkek': {
      'en': 'GIFTS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'zrxnqud4': {
      'en': 'CRAFT',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '70b2bw86': {
      'en': 'STORIES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'b5d6178d': {
      'en': 'My account',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ymvirmfn': {
      'en': 'Stores',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '3z3dzcuv': {
      'en': 'Shipping to United Kingdom - English',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'k4gsiand': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'pm9827b9': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '8ljtsd8c': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'w7i340f8': {
      'en': 'Free shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kxzpwocz': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0mdj24nm': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // Holidayservices
  {
    '0fu07xqt': {
      'en': 'Holiday services',
      'zh_Hans': '假期服务',
      'zh_Hant': '假期服務',
    },
    'p5gjn3wn': {
      'en':
          'Discover a range of seasonal services and \ninformation designed to help you find the \nperfect gifts and make your holiday \nshopping experience as smooth as \npossible.',
      'zh_Hans': '探索一系列季节性服务和\n旨在帮助您找到的信息\n完美的礼物，让您的假期更加美好\n购物体验如\n可能的。',
      'zh_Hant': '探索一系列季節性服務和\n旨在幫助您找到的信息\n完美的禮物，讓您的假期更加美好\n購物體驗如\n可能的。',
    },
    '7ige11c5': {
      'en': 'Last delivery day',
      'zh_Hans': '最后交货日',
      'zh_Hant': '最後交貨日',
    },
    'invri6xl': {
      'en':
          'Please complete your purchase \nbefore 19th December at 3pm \nGMT+1 to receive your order in \ntime for Christmas.',
      'zh_Hans': '请完成您的购买\n12月19日下午3点前\nGMT+1 接收订单的时间\n圣诞节的时间到了。',
      'zh_Hant': '請完成您的購買\n12月19日下午3點前\nGMT+1 接收訂單的時間\n聖誕節的時間到了。',
    },
    '7tokpvpr': {
      'en': 'Hello World',
      'zh_Hans': '你好世界',
      'zh_Hant': '你好世界',
    },
    'w8wix34o': {
      'en': 'Holiday packaging',
      'zh_Hans': '节日包装',
      'zh_Hant': '節日包裝',
    },
    '3qytw67r': {
      'en':
          '\nA menagerie of animals and plants by \nJapanese ceramic studio Suna Fujita \nanimate our festive packaging, creating \nplayful moments across boxes, bags, \ntissue paper, ribbons, and paper tags \nfor in-store purchases and loewe.com \norders.',
      'zh_Hans':
          '动物和植物的动物园\n日本陶瓷工作室Suna Fujita\n使我们的节日包装充满活力，创造\n跨越盒子、袋子的俏皮时刻，\n薄纸、丝带和纸质标签\n用于店内购买和 loewe.com\n命令。',
      'zh_Hant':
          '動物和植物的動物園\n日本陶瓷工作室Suna Fujita\n讓我們的節日包裝充滿活力，創造\n跨越盒子、袋子的俏皮時刻，\n薄紙、緞帶和紙質標籤\n用於店內購買和 loewe.com\n命令。',
    },
    'zwwxggsl': {
      'en': 'Explore',
      'zh_Hans': '探索',
      'zh_Hant': '探索',
    },
    'voamq71x': {
      'en': 'Gifting ideas',
      'zh_Hans': '送礼创意',
      'zh_Hant': '送禮創意',
    },
    'syso69av': {
      'en':
          'A hand-chosen selection of holiday gifts, \nfrom iconic bags and the latest ready-to-\nwear.',
      'zh_Hans': '精心挑选的节日礼物，\n从标志性包袋到最新款\n穿。',
      'zh_Hant': '精心挑選的節日禮物，\n從標誌性包款到最新款\n穿。',
    },
    'cewh61r0': {
      'en': 'Gifts for her',
      'zh_Hans': '给她的礼物',
      'zh_Hant': '給她的禮物',
    },
    's6gn94s8': {
      'en': 'Explore',
      'zh_Hans': '探索',
      'zh_Hant': '探索',
    },
    '6z369933': {
      'en': 'Gifts for hi',
      'zh_Hans': '给他的礼物',
      'zh_Hant': '給他的禮物',
    },
    'e19m87xo': {
      'en': 'Become part of the LOEWE community',
      'zh_Hans': '成为 LOEWE 社区的一部分',
      'zh_Hant': '成為 LOEWE 社區的一部分',
    },
    'ewcoc9cv': {
      'en':
          'Receive first access to the very best of LOEWE \nproducts, inspiration and services.  ',
      'zh_Hans': '抢先体验 LOEWE 最好的产品\n产品、灵感和服务。',
      'zh_Hant': '搶先體驗 LOEWE 最好的產品\n產品、靈感和服務。',
    },
    '01ixv17r': {
      'en': ' See more',
      'zh_Hans': '查看更多',
      'zh_Hant': '看更多',
    },
    'f2omibeo': {
      'en': 'Man*',
      'zh_Hans': '男人*',
      'zh_Hant': '男人*',
    },
    'imoezw58': {
      'en': 'Woman*',
      'zh_Hans': '女士*',
      'zh_Hant': '女士*',
    },
    '209yoq3z': {
      'en': 'Non Binary*',
      'zh_Hans': '非二进制*',
      'zh_Hant': '非二進位*',
    },
    'p1u5uvuf': {
      'en': 'Prefer not to Say*',
      'zh_Hans': '不想说*',
      'zh_Hant': '不想說*',
    },
    '8ir2nt43': {
      'en': 'Email address*',
      'zh_Hans': '电子邮件地址*',
      'zh_Hant': '電子郵件地址*',
    },
    'lfbajnbl': {
      'en': 'OK',
      'zh_Hans': '好的',
      'zh_Hant': '好的',
    },
    'd6iqk58s': {
      'en': 'Client Services',
      'zh_Hans': '客户服务',
      'zh_Hant': '客戶服務',
    },
    'wsyj7zrf': {
      'en': 'Care guide',
      'zh_Hans': '护理指南',
      'zh_Hant': '護理指南',
    },
    'fhyonjrh': {
      'en': 'Sitemap',
      'zh_Hans': '网站地图',
      'zh_Hant': '網站地圖',
    },
    'gmrw9lpe': {
      'en': 'Sustainability',
      'zh_Hans': '可持续发展',
      'zh_Hant': '永續發展',
    },
    'q75bzjya': {
      'en': 'Store Finder',
      'zh_Hans': '商店查找器',
      'zh_Hant': '商店查找器',
    },
    'o9c2nvta': {
      'en': 'Careers',
      'zh_Hans': '职业机会',
      'zh_Hant': '職業機會',
    },
    'aq7g48n2': {
      'en': 'Book an appointment',
      'zh_Hans': '预约',
      'zh_Hant': '預約',
    },
    'h4m18677': {
      'en': 'Terms & conditions',
      'zh_Hans': '条款和条件',
      'zh_Hant': '條款與條件',
    },
    '078uyo6g': {
      'en': 'Shipping & returns',
      'zh_Hans': '运输和退货',
      'zh_Hant': '運輸和退貨',
    },
    'l9mxn45w': {
      'en': 'Privacy and cookies policy',
      'zh_Hans': '隐私和cookies政策',
      'zh_Hant': '隱私權和cookies政策',
    },
    '8znwuf3w': {
      'en': 'Our packaging',
      'zh_Hans': '我们的包装',
      'zh_Hant': '我們的包裝',
    },
    '70k5owep': {
      'en': 'United Kingdom',
      'zh_Hans': '英国',
      'zh_Hant': '英國',
    },
    '2ggl1dqc': {
      'en': '-',
      'zh_Hans': '-',
      'zh_Hant': '-',
    },
    'k80irovu': {
      'en': 'English',
      'zh_Hans': '英语',
      'zh_Hant': '英語',
    },
    'qnastc3r': {
      'en': 'Facebook',
      'zh_Hans': 'Facebook',
      'zh_Hant': 'Facebook',
    },
    'lmlvrfx5': {
      'en': 'Instagram',
      'zh_Hans': 'Instagram',
      'zh_Hant': 'Instagram',
    },
    '8pe9u7qn': {
      'en': 'Twitter',
      'zh_Hans': 'Twitter',
      'zh_Hant': 'Twitter',
    },
    'mnqk8iyi': {
      'en': 'Youtube',
      'zh_Hans': 'Youtube',
      'zh_Hant': 'Youtube',
    },
    '2rbinplk': {
      'en': 'Pinterest',
      'zh_Hans': 'Pinterest',
      'zh_Hant': 'Pinterest',
    },
    'tnmgs7pq': {
      'en': 'WOMEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'o5pq2a5r': {
      'en': 'MEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'u9cyxzqm': {
      'en': 'SS24 COLLECTION',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '977jpt3g': {
      'en': 'GIFTS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'zj86rzv1': {
      'en': 'CRAFT',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5eltynvk': {
      'en': 'STORIES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '6ulpdosn': {
      'en': 'My account',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'f4fauzrz': {
      'en': 'Stores',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bey7od4z': {
      'en': 'Shipping to United Kingdom - English',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'lgzj1013': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'almbcot5': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'db59jgir': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'tkn4dk01': {
      'en': 'Free shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'p1m8s36d': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'o7bk6pn8': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // Myselection
  {
    'ufai3zwz': {
      'en': 'MY SELECTION',
      'zh_Hans': '我的选择',
      'zh_Hant': '我的選擇',
    },
    'clsrqmnr': {
      'en': 'You have 0 items in your selection',
      'zh_Hans': '您的选择中有 0 件商品',
      'zh_Hant': '您的選擇中有 0 件商品',
    },
    'a5qi69mk': {
      'en': 'Discover our most iconic lines',
      'zh_Hans': '探索我们最具标志性的产品线',
      'zh_Hant': '探索我們最具代表性的產品線',
    },
    'tkkhd2zf': {
      'en': 'Find your own ideal iconic bag',
      'zh_Hans': '找到您自己理想的标志性包袋',
      'zh_Hant': '找到您自己理想的標誌性包款',
    },
    'acpy1ag0': {
      'en': 'Puzzle Bags',
      'zh_Hans': '拼图袋',
      'zh_Hant': '拼圖袋',
    },
    'r0o2s6fn': {
      'en': 'See all Puzzle',
      'zh_Hans': '查看所有拼图',
      'zh_Hant': '看所有拼圖',
    },
    'x1j5ordz': {
      'en': 'Become part of the LOEWE community',
      'zh_Hans': '成为 LOEWE 社区的一部分',
      'zh_Hant': '成為 LOEWE 社區的一部分',
    },
    'no5yvqxh': {
      'en':
          'Receive first access to the very best of LOEWE \nproducts, inspiration and services.  ',
      'zh_Hans': '抢先体验 LOEWE 最好的产品\n产品、灵感和服务。',
      'zh_Hant': '搶先體驗 LOEWE 最好的產品\n產品、靈感和服務。',
    },
    'z3xyvzir': {
      'en': ' See more',
      'zh_Hans': '查看更多',
      'zh_Hant': '看更多',
    },
    '5m4718hy': {
      'en': 'Man*',
      'zh_Hans': '男人*',
      'zh_Hant': '男人*',
    },
    'cvo5o3i1': {
      'en': 'Woman*',
      'zh_Hans': '女士*',
      'zh_Hant': '女士*',
    },
    'n9co9k1m': {
      'en': 'Non Binary*',
      'zh_Hans': '非二进制*',
      'zh_Hant': '非二進位*',
    },
    '0yo4bflo': {
      'en': 'Prefer not to Say*',
      'zh_Hans': '不想说*',
      'zh_Hant': '不想說*',
    },
    'aqqww9ng': {
      'en': 'Email address*',
      'zh_Hans': '电子邮件地址*',
      'zh_Hant': '電子郵件地址*',
    },
    'ps8jvvts': {
      'en': 'OK',
      'zh_Hans': '好的',
      'zh_Hant': '好的',
    },
    'h2bojom9': {
      'en': 'Client Services',
      'zh_Hans': '客户服务',
      'zh_Hant': '客戶服務',
    },
    'uyk1cn6a': {
      'en': 'Care guide',
      'zh_Hans': '护理指南',
      'zh_Hant': '護理指南',
    },
    'd4jmsc77': {
      'en': 'Sitemap',
      'zh_Hans': '网站地图',
      'zh_Hant': '網站地圖',
    },
    '95kxccw0': {
      'en': 'Sustainability',
      'zh_Hans': '可持续发展',
      'zh_Hant': '永續發展',
    },
    'fq8fip9n': {
      'en': 'Store Finder',
      'zh_Hans': '商店查找器',
      'zh_Hant': '商店查找器',
    },
    'zc33feoa': {
      'en': 'Careers',
      'zh_Hans': '职业机会',
      'zh_Hant': '職業機會',
    },
    'zd4xhc7c': {
      'en': 'Book an appointment',
      'zh_Hans': '预约',
      'zh_Hant': '預約',
    },
    'v6qtn73r': {
      'en': 'Terms & conditions',
      'zh_Hans': '条款和条件',
      'zh_Hant': '條款與條件',
    },
    'lr822kum': {
      'en': 'Shipping & returns',
      'zh_Hans': '运输和退货',
      'zh_Hant': '運輸和退貨',
    },
    't1qzvo8s': {
      'en': 'Privacy and cookies policy',
      'zh_Hans': '隐私和cookies政策',
      'zh_Hant': '隱私權和cookies政策',
    },
    'vl6sgfid': {
      'en': 'Our packaging',
      'zh_Hans': '我们的包装',
      'zh_Hant': '我們的包裝',
    },
    '8hygdmog': {
      'en': 'United Kingdom',
      'zh_Hans': '英国',
      'zh_Hant': '英國',
    },
    'hwch9wpl': {
      'en': '-',
      'zh_Hans': '-',
      'zh_Hant': '-',
    },
    '3qjiyyos': {
      'en': 'English',
      'zh_Hans': '英语',
      'zh_Hant': '英語',
    },
    'fcn35hlt': {
      'en': 'Facebook',
      'zh_Hans': 'Facebook',
      'zh_Hant': 'Facebook',
    },
    'dco4sbic': {
      'en': 'Instagram',
      'zh_Hans': 'Instagram',
      'zh_Hant': 'Instagram',
    },
    '3bnmad0u': {
      'en': 'Twitter',
      'zh_Hans': 'Twitter',
      'zh_Hant': 'Twitter',
    },
    'b9b4zu2f': {
      'en': 'Youtube',
      'zh_Hans': 'Youtube',
      'zh_Hant': 'Youtube',
    },
    '3js7llqs': {
      'en': 'Pinterest',
      'zh_Hans': 'Pinterest',
      'zh_Hant': 'Pinterest',
    },
    'ohkbgq1y': {
      'en': 'WOMEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '89j7f4fn': {
      'en': 'MEN',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '34m12ckl': {
      'en': 'SS24 COLLECTION',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vxz53jo7': {
      'en': 'GIFTS',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '00tpwkym': {
      'en': 'CRAFT',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'pzh4819z': {
      'en': 'STORIES',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'feckloq4': {
      'en': 'My account',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'nciz87xk': {
      'en': 'Stores',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qdrqowcn': {
      'en': 'Shipping to United Kingdom - English',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'eijpbrgd': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'b43rj005': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0j6zss1t': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'aqgkwt23': {
      'en': 'Free shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ogoqstlo': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'm8heq3ai': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // Deliveryestimation
  {
    'ft9yaoo4': {
      'en': 'Shipping lead times:',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'a206awd8': {
      'en': 'Europe',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qzc7uswl': {
      'en': 'Spain (Mainland and Balearic Islands): 2-6 business \ndays.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0jrwz3h3': {
      'en':
          'Andorra, Austria, Belgium, Bulgaria, Croatia, Cyprus, \nCzech Republic, Denmark, Estonia, Finland, \nMetropolitan France, Germany, Greece, Hungary, \nIreland, Italy, Latvia, Lithuania, Luxembourg, Malta, \nMonaco, Netherlands, Norway, Poland, Portugal, \nRomania, Slovakia, Slovenia, Sweden, Switzerland, \nUnited Kingdom: 2-7 business days.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '26nb97ah': {
      'en': 'Asia, Middle East',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'uifm8f7k': {
      'en':
          'Bahrain, Brunei, Hong Kong SAR, India, Indonesia, Israel, \nJapan, Jordan, Kuwait, Lebanon, Macao SAR, Malaysia, \nOman, Philippines, Qatar, Saudi Arabia, South Korea,\n Singapore, Taiwan Region, Thailand, UAE: 2-7 business \ndays',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wc5tuvi0': {
      'en': 'America Oceania',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '9c6bbx32': {
      'en':
          'Australia, Canada, Chile, Colombia, Mexico, New \nZealand, Puerto Rico, United States of America: 2-7 \nbusiness days',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'l420qeo9': {
      'en': 'Africa',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'arxvh5os': {
      'en':
          'Ivory Coast, Kenya, Mauritius, Morocco, Nigeria, \nSenegal, South Africa: 2-7 business days',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'lwj6ahgq': {
      'en': 'Click & Collect',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bu80uv9b': {
      'en':
          'We offer the possibility to pick up your loewe.com order \nin the selected store of your choice rather than have it \nsent as a delivery. This service is always complimentary. \nYou will receive an email confirmation when your order\n is ready to be collected from the store. ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'v4b3vngh': {
      'en': 'here.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'goj8uivs': {
      'en':
          'Please visit the selected store within 15 days after this \nemail is sent to collect your order.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'u0witkvd': {
      'en': 'How to return',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'i3u1b4t6': {
      'en':
          'Free returns are available within 14 days of your online \norder delivery date.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'rzzlwx0p': {
      'en': 'Simply enter on My Account or click ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'pusmd928': {
      'en': 'here.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'euluai1p': {
      'en':
          'Please note that the items must be in re-saleable \ncondition and that personalised items are non-\nexchangeable, non-refundable.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wk3gmrmc': {
      'en': 'How to change to another size or color',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'uf7grc23': {
      'en':
          'You can exchange your order within 30 days of your \nonline purchase at any of our retail stores worldwide.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'hkg910kj': {
      'en':
          'Simply check for a convenient option from our list of \nstores and their opening times ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'elqswl6i': {
      'en': 'here.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'evmas2e5': {
      'en':
          'Please ensure that you bring the delivery note included\n with your package with you to the store.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ddqc21c5': {
      'en': 'Sending a gift',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '5hdxlltd': {
      'en':
          'All items purchased as a gift are gift-wrapped on a \ncomplimentary basis, and include a personalised note \nthat you specify when confirming your purchase.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ix0rw6go': {
      'en':
          'Gifts are shipped in brand-free boxing and no price is \nincluded in the delivery documentation. ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xdwgcau6': {
      'en':
          'Items may be exchanged in retail stores within 30 days \nof the online purchase date.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'scsu4ewn': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'dtdetok9': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'd1zkxvno': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'zfo950md': {
      'en': 'Free shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vtqpbbuc': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '1s23hd6a': {
      'en': 'Home',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // Freeshippingandreturns
  {
    'ewe3l0ue': {
      'en': 'Free shipping',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'hvh198rp': {
      'en': 'How long will it take to arrive',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'x8421owo': {
      'en': 'Spain: 2-6 business days',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kqf715up': {
      'en': 'Rest of Europe: 2-7 business days ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ettydqw2': {
      'en': 'Check the international shipping lead times here ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'df8not7c': {
      'en': 'How to return',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'yv2r4qce': {
      'en':
          'Free returns are available within 14 days of your online order\ndelivey date.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kvu7p95z': {
      'en': 'Simply enter on My Account or click',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'a582q5xb': {
      'en': '  here.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ozeukqm8': {
      'en': 'How to exchange to another size or colour',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'se9r8yav': {
      'en':
          'You can exchange your order within within 30 days at our\noffline stores (except for department stores, outlets,\nwholesalers and franchises) within the same country of \npurchase.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'lvgnqdya': {
      'en':
          'Simply check for a convenient option from our list of stores and\ntheir opening times ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '933oiax5': {
      'en': ' here',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'gld24cy7': {
      'en':
          'Please ensure that you bring the delivery note included within \nyour package with you to the store.',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'incij0p5': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '19z65qzl': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kzg7cxve': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ybvkmqxa': {
      'en': 'Free shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'i6yx1xir': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'trv9n857': {
      'en': 'Home',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // Contactus
  {
    'qdn66dxf': {
      'en': 'Need help?',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '23xg7dcc': {
      'en': 'Call us 10am - 7pm  (GMT + 1) Monday to Saturday',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bkktwdb9': {
      'en': 'English +44 2 074 991 284',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'vudujkgf': {
      'en': 'Spanish +34 91 153 81 81',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'm2h418ir': {
      'en': 'French +33 (0) 1 56 43 46 20',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'sqovna67': {
      'en': 'Email us ',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '2fxy2bhb': {
      'en': 'clientservices_eu@loewe.com',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '48rjw179': {
      'en': 'My basket (0)',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wlmbebe1': {
      'en': 'You have no items in your basket',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'q9zoldvp': {
      'en': 'Delivery estimation',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'w86vskpi': {
      'en': 'Free shipping & returns',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'kw7m1tvf': {
      'en': 'Contact us',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '0o3d0ohf': {
      'en': 'Home',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
  // Search
  {
    'uxve1gcq': {
      'en': '                         Search',
      'zh_Hans': '电子邮件地址*',
      'zh_Hant': '電子郵件地址*',
    },
    'bq477i2w': {
      'en': 'Home',
      'zh_Hans': '家',
      'zh_Hant': '家',
    },
  },
  // Miscellaneous
  {
    'yjw2ppvy': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'clnnggly': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'k2g8k0u5': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'bm7oqoe3': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '1b7gx5mc': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'zihygfed': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'u2ql7c4m': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ox44oa8t': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'e6t2nhc0': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'a7c9d0h3': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '91vhlbm1': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'qmjth7yl': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'rfe2usii': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'xf03iprt': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'lrc4tpes': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '8i3cwv8a': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    '39fsxe9f': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'nf3f6ggk': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'jbntej3c': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'wbf8m5d3': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'pvb1v1es': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'ia57kqrd': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
    'lzogfr4v': {
      'en': '',
      'zh_Hans': '',
      'zh_Hant': '',
    },
  },
].reduce((a, b) => a..addAll(b));
