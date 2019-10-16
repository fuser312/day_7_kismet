import 'package:day_6_kismet/story_brain.dart';
import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark(),
      home: KismetApp(),
    )
);



class KismetApp extends StatefulWidget {

  @override
  _KismetAppState createState() => _KismetAppState();
}


class _KismetAppState extends State<KismetApp> {

  List<Story> allStories = StoryData().stories;
  Story currentStory;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    currentStory = allStories[index];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png")
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(currentStory.story,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Visibility(

                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        index = currentStory.choice1_result;
                      });
                    },
                    color: Colors.red,
                    child: Text(
                      currentStory.choice1,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //TODO: Step 14 - Use a Flutter Visibility Widget to wrap this FlatButton and set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: Visibility(
                  visible: ending(index),
                  child: FlatButton(
                    onPressed: () {
                      //Choice 2 made by user.
                      setState(() {
                        index = currentStory.choice2_result;
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      currentStory.choice2,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


