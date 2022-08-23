import 'package:flutter/material.dart';

class DietsScreen extends StatefulWidget {
  const DietsScreen({Key? key}) : super(key: key);

  @override
  State<DietsScreen> createState() => _DietsScreenState();
}

class _DietsScreenState extends State<DietsScreen> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Diet Tracking Tips',
          style: TextStyle(color: Colors.white70),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Divider(
              height: 20.0,
              color: Colors.grey[300],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 244, 247),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 195, 197, 211),
                    offset: Offset(0.0, 5.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ExpansionTile(
                leading: Icon(
                  Icons.water_drop,
                  color: Colors.blue,
                ),
                title: const Text('Water and Its Importance',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: const Text(
                    '<Pure Water is the World\'s First and Foremost Medicine>',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                    )
                ),
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.lightbulb
                      : Icons.lightbulb_outline,
                ),
                children: const <Widget>[
                  ListTile(
                      title: Text(
                    '> 60% of Human body is water and hence drinking water helps maintain body fluid balance.\n\n> 8 glass per day or 1 glass per 20LB of body weight. Add an additional glass when sweating or drinking coffee or tea.\n\n> Drinking more water helps better mood, boost brain, keeps heart healthy, removes toxins, clear skin and loss weight.\n ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 160, 153),

                      fontSize: 10.0,
                    ),
                  )),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              color: Colors.grey[300],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 244, 247),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 195, 197, 211),
                    offset: Offset(0.0, 5.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ExpansionTile(
                leading:
                    Icon(Icons.note, color: Color.fromARGB(255, 189, 183, 120)),
                title: const Text('Log Your In-Take',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: const Text(
                    '<Eat Quantity-Optimal, Neither Less nor More! Eat Quality-Optimal, Fresh and Right Calorie Amount!>',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                    )
                ),
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.lightbulb
                      : Icons.lightbulb_outline,
                ),
                children: const <Widget>[
                  ListTile(
                      title: Text(
                    '> What are you eating? Keep a track of the kind of food you consume on a dialy basis, is it baked, fried, boiled, etc. Then also have a monthly idea of intake of cheat-day foods. \n\n> How much are you eating? Take the note of the amount of food ingredient in your household in grams and then estimate the portions intake. Also try to divide the dialy intake into smaller-digestable portions \n\n> When are you eating? This type of penning down will help you avoid untimely snakcing and hence help in longer run.\n ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 160, 153),
                      fontSize: 10.0,
                    ),
                  )),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              color: Colors.grey[300],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 244, 247),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 195, 197, 211),
                    offset: Offset(0.0, 5.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ExpansionTile(
                leading: Icon(Icons.heat_pump_rounded,
                    color: Color.fromARGB(255, 156, 84, 108)),
                title: const Text('Be Honest with Yourself',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle:
                    const Text('<Health-Honesty is the Best Diet-Policy!>',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                    ),),
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.lightbulb
                      : Icons.lightbulb_outline,
                ),
                children: const <Widget>[
                  ListTile(
                      title: Text(
                    '> Most important is being honest to yourself, what\'s the need to lie to oneself and do self-harm.\n\n> Often seen we are more worried about what others might feel after seeing us stuff in 10 slices of pizza in ago but never would we actually care about it\'s impact solely for ourself\n\n> We even want our diet to look better when jotting down if this is the notion attached then of course Noting Down would be great.\n ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 160, 153),
                      fontSize: 10.0,
                    ),
                  )),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              color: Colors.grey[300],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 244, 247),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 195, 197, 211),
                    offset: Offset(0.0, 5.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ExpansionTile(
                leading: Icon(
                  Icons.sports_gymnastics,
                  color: Colors.pinkAccent,
                ),
                title: const Text('Weight Loss Holistic Strategies',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: const Text(
                    '<Weight Loss doesn\'t begin in the GYM, it starts in your head with a decision - Toni Sorenson>',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                  ),),
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.lightbulb
                      : Icons.lightbulb_outline,
                ),
                children: const <Widget>[
                  ListTile(
                      title: Text(
                    '> Weight loss is a journey and not a overnight change, so be gentle on yourself.\n\n> Consistency is a key in the process because excuses don\'t burn callories and success is the net sum of every day\'s hardwork.\n\n> Exercising and diet go hand in hand, never skip meals that\'s definitely not how it works.\n ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 160, 153),
                      fontSize: 10,
                    ),
                  )),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              color: Colors.grey[300],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 244, 247),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 195, 197, 211),
                    offset: Offset(0.0, 5.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ExpansionTile(
                leading: Icon(
                  Icons.apple,
                  color: Colors.red,
                ),
                title: const Text('Weight Gain Holistic Strategies',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: const Text(
                    '<Underweight can be as concerning or more than being over-weight, we need to reboot>',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                  ),),
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.lightbulb
                      : Icons.lightbulb_outline,
                ),
                children: const <Widget>[
                  ListTile(
                      title: Text(
                    '> Eating more freqently might be halpful, but this doesn\'t mean resorting to low-nutrition value foods \n\n> Exercise like strength training can help you gain weight by building up muscles \n\n> Watch when you drink, its seen few people find their appetite vanish because of drinking fluids before or near meals \n ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 160, 153),
                      fontSize: 10,
                    ),
                  )),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              color: Colors.grey[300],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 244, 247),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 195, 197, 211),
                    offset: Offset(0.0, 5.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ExpansionTile(
                leading: Icon(
                  Icons.boy,
                  color: Colors.deepPurple,
                ),
                title: const Text('Maintaining Weight',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: const Text(
                    '<Losing Weight is Hard, Staying Overweigth is Hard and Maintaining Weight is Hard, Choose Your Hard>',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                  ),),
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.lightbulb
                      : Icons.lightbulb_outline,
                ),
                children: const <Widget>[
                  ListTile(
                      title: Text(
                    '> Physical activity plays a crucial role in the maintainence of the weight, even non-rigorous day-to-day exercises such as walking are very effective\n\n> This is an important key which prevents the yoyo-dieting which extremely dangerous to our health for this we should avoid both skipping meals as well as in-talk of oily and fat rich diet.\n\n> Take care of yourself by keeping yourself hydrated, stress-free and nutirent-rich.\n\n> Eat fruits and vegetables with each of your meals as these can make you feel full without gaining or losing weight but are full of vitamins, minerals, antioxidants, fibres which help in digestion but be cautious of sugar in fruits\n ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 160, 153),
                      fontSize: 10,
                    ),
                  )),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              color: Colors.grey[300],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 244, 247),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 195, 197, 211),
                    offset: Offset(0.0, 5.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ExpansionTile(
                leading: Icon(
                  Icons.fitness_center,
                  color: Colors.brown,
                ),
                title: const Text('Muscle Building Strategies',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle:
                    const Text('<You can have Results or Excuses, not both! >',
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                      ),),
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.lightbulb
                      : Icons.lightbulb_outline,
                ),
                children: const <Widget>[
                  ListTile(
                      title: Text(
                    '> Eating protein-rich food is extremely vital as it the boost your muscles are looking for.\n\n> Eating every 3 hours is a great strategy if properly utilized, this doesn\'t grant you a permit to stuff in over and over food but means eating smaller meals more frequently than a few big meals. This will reduce your cravings and stop from over-eating when hungry during meals.\n ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 160, 153),
                      fontSize: 10,
                    ),
                  )),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              color: Colors.grey[300],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 244, 247),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 195, 197, 211),
                    offset: Offset(0.0, 5.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: ExpansionTile(
                leading: Icon(
                  Icons.food_bank,
                  color: Colors.amber,
                ),
                title: const Text('Basic Balanced Diet',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: const Text(
                    '<Diet is the essential key to all successful healing. ~ Michael Tierra>',
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                  ),),
                trailing: Icon(
                  _customTileExpanded
                      ? Icons.lightbulb
                      : Icons.lightbulb_outline,
                ),
                children: const <Widget>[
                  ListTile(
                      title: Text(
                    'An ideal diet depends on many factors such as age, build, requirement, body-type etc but a general perspective of healthy and balanced diet is inclusive of :\n> 40% Fruits and Vegetables \n> 25% Fibre-rich carbohydrates\n> 25% Protein\n> 10% Healthy Fats \n ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 160, 153),
                      fontSize: 10,
                    ),
                  )),
                ],
                onExpansionChanged: (bool expanded) {
                  setState(() => _customTileExpanded = expanded);
                },
              ),
            ),
            SizedBox(height: 10.0),
            Divider(
              height: 20.0,
              color: Colors.grey[300],
            ),
            Icon(
              Icons.health_and_safety,
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}
