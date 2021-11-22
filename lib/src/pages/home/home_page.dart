import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/src/configs/app_route.dart';
import 'package:mini_project/src/configs/app_setting.dart';
import 'package:mini_project/src/widgets/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final List<String> images = [
    'https://content.r9cdn.net/rimg/himg/a1/58/6c/leonardo-220837398-cnxmd-guestroom-5779-hor-clsc_O-078240.jpg?width=216&height=216&xhint=1620&yhint=1000&crop=true&caller=HotelInlineCarousel&watermarkheight=16&watermarkpadding=10',
    'https://content.r9cdn.net/rimg/himg/e2/c6/a3/sembo-118373668-606444af_z.jpg_resizeMode=FitInside_formatSettings=jpeg(quality-90)-676458.jpg?width=216&height=216&xhint=520&yhint=333&crop=true&caller=HotelInlineCarousel&watermarkheight=16&watermarkpadding=10',
    'https://content.r9cdn.net/rimg/himg/eb/f4/30/revato-10796-13219019-969776.jpg?width=216&height=216&xhint=561&yhint=360&crop=true&caller=HotelInlineCarousel&watermarkheight=16&watermarkpadding=10',
    'https://content.r9cdn.net/rimg/himg/ff/af/27/leonardo-4993086-CNXCM_6599349254_O-468181.jpg?width=216&height=216&xhint=1620&yhint=1001&crop=true&caller=HotelInlineCarousel&watermarkheight=16&watermarkpadding=10',
    'https://content.r9cdn.net/rimg/himg/7a/39/b0/hotelsdotcom-76490356-daf21f55_w-957388.jpg?width=216&height=216&xhint=1000&yhint=780&crop=true&caller=HotelInlineCarousel&watermarkheight=16&watermarkpadding=10',
    'https://content.r9cdn.net/rimg/himg/ad/36/32/sembo-118379204-be38552f_z.jpg_resizeMode=FitInside_formatSettings=jpeg(quality-90)-332428.jpg?width=216&height=216&crop=true&caller=HotelInlineCarousel&watermarkheight=16&watermarkpadding=10',
    'https://content.r9cdn.net/rimg/himg/e3/75/a5/sembo-TH-H114274-169c4724_z.jpg_resizeMode=FitInside_formatSettings=jpeg(quality-90)-283255.jpg?width=216&height=216&xhint=480&yhint=333&crop=true&caller=HotelInlineCarousel&watermarkheight=16&watermarkpadding=10',
  ];
  List<Map<String, String>> imgArray = [
    {
      "img":
      "https://content.r9cdn.net/rimg/himg/ff/af/27/leonardo-4993086-CNXCM_6599349254_O-468181.jpg?width=216&height=216&xhint=1620&yhint=1001&crop=true&caller=HotelInlineCarousel&watermarkheight=16&watermarkpadding=10",
      "title": "โรงแรมฮอลิเดย์อินน์",
      "description":
      "โรงแรมมีที่ตั้งในเมือง เมืองเชียงใหม่ และบริการที่พักหรูหราพร้อมมีห้องเซาว์น่า และ สระว่ายน้ำกลางแจ้ง ที่นี่มีเช็คอิน/เช็คเอาท์แบบด่วน, บริการรถรับส่งฟรี และ รูมเซอร์วิส 24 ชั่วโมง.",
      "price": "\$125",
      "page": "login"
    },
    {
      "img":
      "https://content.r9cdn.net/rimg/himg/a1/58/6c/leonardo-220837398-cnxmd-guestroom-5779-hor-clsc_O-078240.jpg?width=216&height=216&xhint=1620&yhint=1000&crop=true&caller=HotelInlineCarousel&watermarkheight=16&watermarkpadding=10",
      "title": "เลอ เมอริเดียน",
      "description":
      "เลอ เมอริเดียน เชียงใหม่ มีที่ตั้งในเมือง เมืองเชียงใหม่ และเป็นที่พักโมเดิร์นพร้อมมีวิวตัวเมือง จากโรงแรมระดับ 5 ดาวแห่งนี้สามารถมองเห็นวิว ดอยสุเทพ พร้อมมีห้องเซาว์น่า",
      "price": "\$200",
      "page": "info"
    },
    {
      "img":
      "https://content.r9cdn.net/rimg/himg/eb/f4/30/revato-10796-13219019-969776.jpg?width=915&height=345&xhint=561&yhint=360&crop=true",
      "title": "โรงแรมฟูราม่า",
      "description":
      "โรงแรมฟูราม่า เชียงใหม่ มีที่ตั้งในเมือง เมืองเชียงใหม่ และสามารถนั่งรถ วัดเจ็ดยอด และ เชียงใหม่ไนท์บาซาร์ ในระยะทางสั้น ๆ เท่านั้น นอกจากจะมีที่จอดรถยนต์สาธารณะฟรีในบริเวณแล้ว",
      "price": "\$300",
      "page": "upcoming"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/fis.jpg'),
              ),
              accountName: Text('Hafis  Kalupae',
                style: TextStyle(color: Colors.white),),
              accountEmail: Text('624235010@parichat.skru.ac.th',style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
            ),
            ...MenuViewModel()
                .items
                .map((e) => ListTile(
              leading: Icon(
                e.icon,
                color: e.iconColor,
              ),
              title: Text(e.title),
              onTap: () {
                e.onTap(context);
              },
            ))
                .toList(),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(AppSetting.userNameSetting);
                prefs.remove(AppSetting.passwordSetting);
                Navigator.pushNamed(context, AppRoute.loginRoute);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  child: Center(
                      child: Image.network(images[index],
                          fit: BoxFit.cover, width: 1000)),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: imgArray
                  .map((item) => GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, item["page"]);
                },
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                                blurRadius: 8,
                                spreadRadius: 0.3,
                                offset: Offset(0, 3))
                          ]),
                          child: AspectRatio(
                            aspectRatio: 2 / 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                item["img"],
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            Text(item["price"],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.pink.shade200)),
                            Text(item["title"],
                                style:
                                TextStyle(fontSize: 32, color: Colors.black)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 8),
                              child: Text(
                                item["description"],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.pink.shade200),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
                  .toList(),
              options: CarouselOptions(
                  height: 530,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  aspectRatio: 4 / 4,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  // viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
} //end class
