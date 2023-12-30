// ignore_for_file: unnecessary_import, library_private_types_in_public_api, deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
    path: 'assets', // مسار الملفات
    fallbackLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'WhatsApp Direct', // استخدام النص المترجم
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCountryCode = '+20'; // تعيين قيمة افتراضية

  TextEditingController phoneController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  bool isFieldActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 44, 44),
        title: Center(
          child: Text(
            'app_title'.tr(),
            style: const TextStyle(
              fontFamily: 'Disket',
              color: Color.fromARGB(255, 29, 170, 97),
            ),
          ),
        ), // استخدام النص المترجم
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/wallpaperDark.jpg',
              )),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select country code and enter number',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.arrow_drop_down_rounded,
                      size: 30, color: Colors.white),
                ],
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(30, 60)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 44, 44, 44)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 97, 93, 101),
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 500,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10)),
                                color: Color.fromARGB(255, 44, 44, 44),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      trailing: const Text(
                                        '20+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Egypt.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Egypt',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+20';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '974+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Qatar.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Qatar',
                                        style: TextStyle(
                                          color: Colors
                                              .white, // تغيير لون النص إلى الأبيض
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+974';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '966+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Saudi.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Saudi',
                                        style: TextStyle(
                                          color: Colors
                                              .white, // تغيير لون النص إلى الأبيض
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+966';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '971+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/UAE.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'UAE',
                                        style: TextStyle(
                                          color: Colors
                                              .white, // تغيير لون النص إلى الأبيض
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+971';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '212+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Moroco.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Moroco',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+212';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '973+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Bahrain.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Bahrain',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+973';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '968+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Oman.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Oman',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+968';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '965+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Kuwait.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Kuwait',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+965';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '962+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Jordan.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Jordan',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+962';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '216+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Tunisia.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Tunisia',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+216';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '218+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Libya.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Libya',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+218';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '970+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Palestine.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Palestine',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+970';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '213+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Algeria.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Algeria',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+213';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '222+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Mauritania.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Mauritania',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+222';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '961+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Lebanon.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Lebanon',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+961';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '249+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Sudan.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Sudan',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+249';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      trailing: const Text(
                                        '964+',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Disket',
                                            fontSize: 15),
                                      ),
                                      leading: Image.asset(
                                        'assets/images/Flags/Iraq.png',
                                        height: 25,
                                      ),
                                      title: const Text(
                                        'Iraq',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Disket',
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedCountryCode = '+964';
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    // يمكنك استكمال الأرقام الأخرى بنفس الطريقة
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedCountryCode,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 29, 170, 97),
                                fontFamily: 'Disket',
                                fontWeight: FontWeight.normal),
                          ),
                          const Icon(Icons.arrow_drop_down_rounded,
                              size: 30,
                              color: Color.fromARGB(255, 29, 170, 97)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 280,
                      child: TextField(
                        style: const TextStyle(
                          fontFamily: 'Disket',
                          color: Color.fromARGB(255, 29, 170, 97),
                        ),
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 29, 170, 97),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 29, 170, 97),
                            ),
                          ),
                          hintText: "Enter a phone number",
                          hintStyle: const TextStyle(
                            fontFamily: 'Disket',
                            color: Color.fromARGB(150, 29, 170, 97),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            isFieldActive = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: SizedBox(
                  height: 300,
                  child: TextField(
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    scrollPhysics: const ScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    textAlign: TextAlign.left,
                    textAlignVertical: TextAlignVertical.top,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 29, 170, 97),
                    ),
                    controller: messageController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 29, 170, 97),
                        ),
                      ),
                      hintText: "Enter your message",
                      hintStyle: const TextStyle(
                        fontFamily: 'Disket',
                        color: Color.fromARGB(150, 29, 170, 97),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(200, 40)),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 44, 44, 44)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                color: Color.fromARGB(
                                    255, 97, 93, 101), // لون الحدود الخارجية
                                width: 1.0, // عرض الحدود الخارجية
                              ),
                            ),
                          ),
                        ),

                        onPressed: () {
                          _launchWhatsApp(
                            selectedCountryCode + phoneController.text,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'send_via_whatsapp'.tr(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 29, 170, 97),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(5)),
                            Image.asset(
                              'assets/images/whatsapp.png',
                              height: 18,
                            ),
                          ],
                        ), // استخدام النص المترجم
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(200, 40)),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 44, 44, 44)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                color: Color.fromARGB(
                                    255, 97, 93, 101), // لون الحدود الخارجية
                                width: 1.0, // عرض الحدود الخارجية
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _launchWhatsAppBusiness(
                            selectedCountryCode + phoneController.text,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'send_via_Business'.tr(), // النص المترجم
                              style: const TextStyle(
                                color: Color.fromARGB(255, 29, 170, 97),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(5)),
                            Image.asset(
                              'assets/images/whatsappB.png',
                              height: 18,
                            ),
                          ],
                        ), // استخدام النص المترجم
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(200, 40)),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 44, 44, 44)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                color: Color.fromARGB(
                                    255, 97, 93, 101), // لون الحدود الخارجية
                                width: 1.0, // عرض الحدود الخارجية
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _launchTelegram(
                            selectedCountryCode + phoneController.text,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'send_via_telegram'.tr(), // النص المترجم
                              style: const TextStyle(
                                color: Color.fromARGB(255, 29, 170, 97),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(5)),
                            Image.asset(
                              'assets/images/telegram.png', // أيقونة تليجرام
                              height: 18,
                            ),
                          ],
                        ), // استخدام النص المترجم
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          minimumSize:
                              MaterialStateProperty.all(const Size(200, 40)),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 44, 44, 44)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(
                                color: Color.fromARGB(
                                    255, 97, 93, 101), // لون الحدود الخارجية
                                width: 1.0, // عرض الحدود الخارجية
                              ),
                            ),
                          ),
                        ),

                        onPressed: () {
                          if (context.locale.languageCode == 'ar') {
                            context.locale = const Locale('en', 'US');
                          } else {
                            context.locale = const Locale('ar', 'SA');
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'change_language'.tr(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 29, 170, 97),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(5)),
                            Image.asset(
                              'assets/images/arabic.png',
                              height: 18,
                              color: const Color.fromARGB(150, 29, 170, 97),
                            ),
                          ],
                        ), // استخدام النص المترجم
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchWhatsApp(String phone) async {
    String url =
        'https://wa.me/$phone?text=${Uri.encodeFull(messageController.text)}'; // تمت إضافة الرسالة المرادة للرابط
    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchWhatsAppBusiness(String phone) async {
    String url =
        'https://api.whatsapp.com/send?phone=$phone&text=${Uri.encodeFull(messageController.text)}';
    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchTelegram(String phone) async {
    String url =
        'https://telegram.me/$phone?text=${Uri.encodeFull(messageController.text)}';
    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
