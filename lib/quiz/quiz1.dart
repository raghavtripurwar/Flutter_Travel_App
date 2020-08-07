import 'package:flutter/material.dart';
import 'package:sah_app/Pages/pageview.dart';
import 'package:sah_app/Pages/tripplan.dart';


var finalScore = 0;
var questionNumber = 0;
var quiz = new AnimalQuiz();
List<int> interest=[];

class AnimalQuiz{

  var questions = [
    "Out of these which is the most appealing to you?",
    "Do you prefer religious paintings or scluptures?",
    "Which amongst these describes the best of your interests",
  ];


 var choices = [
  ["A place so blessed that a stone produces metallic sound", "Varandas where 200 people could have dinner in indian style", "one of the largest dams in asia and a taste of royal indian  clothing", "A place where Hi deer is a valid statement"],
   ["A  pictorial representation of indian culture", "Monument so advanced that it was termed as incapturable", "An ingenious 17th water mill", "12th sign of light"],
  ["cannon possessing the capability of hitting the surrounding hills.", "Rock cut monasteries and temple cave.", "A meteorite(not an ordinary one)", "The Taj of Deccan"],
  ];
  var places=[
    [8,3,6,5],
    [0,2,7,4],
    [2,3,8,1],
  ];

}

class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: ListView(
              children: <Widget>[
            new Text("Question ${questionNumber + 1} of ${quiz.questions.length}",
                       style: new TextStyle(
                            fontSize: 22.0
                        ),),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
              new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
              new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blue,
                      onPressed: (){

                        interest.add(quiz.places[questionNumber][0]);
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.black
                        ),),
                    ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                new MaterialButton(
                  minWidth: 120.0,
                  color: Colors.blue,
                  onPressed: (){

                    interest.add(quiz.places[questionNumber][1]);
                    updateQuestion();
                  },
                  child: new Text(quiz.choices[questionNumber][1],
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.black
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                new MaterialButton(
                  minWidth: 120.0,
                  color: Colors.blue,
                  onPressed: (){

                    interest.add(quiz.places[questionNumber][2]);
                    updateQuestion();
                  },
                  child: new Text(quiz.choices[questionNumber][2],
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.black
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                new MaterialButton(
                  minWidth: 120.0,
                  color: Colors.blue,
                  onPressed: (){

                    interest.add(quiz.places[questionNumber][3]);
                    updateQuestion();
                  },
                  child: new Text(quiz.choices[questionNumber][3],
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.black
                    ),),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                ),
                  new MaterialButton(
                    minWidth: 240.0,
                    height: 30.0,
                    color: Colors.red,
                    onPressed: resetQuiz,
                    child: new Text("Quit",
                      style: new TextStyle(
                          fontSize: 10.0,
                          color: Colors.black
                      ),)
                ),

                ],

              ),
            )





    ),
        );

  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }



  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1){

       Navigator.push(context, new MaterialPageRoute(builder: (context)=> Container(child: Map_Page(interest),)));

      }else{
        questionNumber++;
      }
    });
  }
}


