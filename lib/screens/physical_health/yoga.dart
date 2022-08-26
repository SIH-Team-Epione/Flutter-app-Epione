import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quiz_app/screens/physical_health/pose_estimate.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teachable/teachable.dart';

class YogaScreen extends StatefulWidget {
  const YogaScreen({Key? key}) : super(key: key);

  @override
  State<YogaScreen> createState() => _YogaScreenState();
}

class _YogaScreenState extends State<YogaScreen> {

  final controller = CarouselController();

  final urlImages = [
    "assets/images/yoga_home.jpg",
    "assets/images/warrior.jpg",
    "assets/images/tree.jpg",
    "assets/images/goddess.jpeg",
    "assets/images/downdog.jpg",
    "assets/images/plank.jpg"
  ];
  final headings = [
    "Yoga Pose Detection",
    "Warrior2",
    "Tree",
    "Goddess",
    "Downdog",
    "Plank"
  ];
  final hindi = [
    "Yog",
    "Virabhadrasana",
    "Vrikshasana",
    "Utkatakonasana",
    "Adho Mukha Svanasana",
    "Phalakasana"
  ];
  final texts = [
    "Yoga ('union') is a group of physical, mental, and spiritual practices/disciplines which originated in ancient India and aim to control (yoke) and still the mind. It helps improve general wellness by relieving stress, supporting good health habits, and improving mental/emotional health, sleep, and balance.\nTry out different yoga poses and try to improve your accuracy score!",
    "Warrior II requires strength and stability, but also flexibility in the hips and upper body. This teaches us about one of the key principles of yoga practice; the balance of sthira & sukha (steadiness & ease). It also teaches us to involve the whole body in asana, and to remember that which is out of sight i.e. keeping the back arm lifted and back foot grounded.",
    "This pose leaves you in a state of rejuvenation. It stretches the legs, back and    arms, and invigorates you. It brings balance and equilibrium to your mind. It helps improve concentration. This posture has been found to relieve some cases of sciatica. It makes the legs strong, improves balance, and opens the hips.",
    "The Goddess Pose can be part of yoga sequences for the hips, chest, and groins. The pushing of sit bones with the lifting of the spine while opening the arms out helps release any kind of tightness (both physical & emotional). It helps to achieve emotional balance, resulting in a higher level of positive energy and overall health & happiness.",
    "Downward-Facing Dog Pose tones the arms and legs, opens and strengthens the shoulders in flexion, lengthens the hamstrings, stretches the calves, and prepares the body for heating.",
    "Plank Pose tones all of the core muscles of the body, including the abdomen, chest, and low back. It strengthens the arms, wrists, and shoulders, and is often used to prepare the body for more challenging arm balances. Plank also strengthens the muscles surrounding the spine, which improves posture."
  ];

  final poseName = [
    "",
    "Warrior",
    "Tree",
    "Goddess",
    "Downdog",
    "Plank"
  ];

  int activeIndex=0;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Yoga Pose Detection'),
      centerTitle: false,
    ),
    backgroundColor: Color(0xffe0f4f0),
    body: Center(
      child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: urlImages.length,
              options: CarouselOptions(
                height: 480,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                onPageChanged: (index,reason) =>
                    setState(() => activeIndex = index),
              ),
            itemBuilder: (context, index, realIndex)  {
                final urlImage = urlImages[index];
                final head = headings[index];
                final text = texts[index];
                final pose = poseName[index];
                final hindiName = hindi[index];

                return buildImage(urlImage,head, text, index, context, pose, hindiName);
            },
          ),
            const SizedBox(height: 20,),
            buildIndicator(),
          ],
        ),
    ),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImages.length,
    onDotClicked: animateToSlide,
    effect: SlideEffect(
      dotColor: Colors.black12,
      activeDotColor: Colors.teal
    ),
  );

  void animateToSlide(int index) => controller.animateToPage(index);

}
Widget buildImage(String urlImage,String head, String text, int index, context, String pose, String hindiName) => InkWell(
  onTap: (){
    if (pose != "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => new PoseEstimatorPage(posename: pose,)),);
    }
    else{

    }
    },
  autofocus: true,
  child:   Container(
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.teal.withOpacity(0.1),
        blurRadius: 10,
          spreadRadius: 5,
      )]
    ),
    margin: EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 40,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  head,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 40,
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Text(
                hindiName,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            height: 320,
            child: Image.asset(
              urlImage,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    ),
  ),
);


// Scaffold(
// appBar: AppBar(
// title: Text('Yoga Pose Detection',
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.w500,
// ),
// ),
// ),
// body: SingleChildScrollView(
// child: Column(
// children: [
// Padding(
// padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
// child: ElevatedButton(
// onPressed: (){
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => new PoseEstimatorPage(posename: 'Downdog',)),
// );
// },
// child: Container(
// width: MediaQuery.of(context).size.width*0.8,
// child: Column(
//
// ),
// ),
// ),
// )
// ],
// ),
// ),
// );

