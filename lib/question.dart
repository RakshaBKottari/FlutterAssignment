import 'package:flutter/material.dart';
import 'result.dart';    

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key}); 

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //creation of questions and answer 
  //map
  List quizListData = [
    {
      "answer": "wiggle",
      "is_answered": 0,
      "is_answer_status_right_wrong_notanswered": 0,
      
      "title":
          "What do you call a group of corgis?",
     
      "options": [
       
        {
          "value": "puff",
          "color": "0xFFFFFFFF",
        },
        {
         
          "value": "fluff",
          "color": "0xFFFFFFFF",
        },
        {
         
          "value": "wiggle",
          "color": "0xFFFFFFFF",
        },
      ],

    },


    {
      "answer": "ListView",
      "is_answered": 0,
      "is_answer_status_right_wrong_notanswered": 0,
      "title":
       "Which widget in Flutter is used to create a scrollable list of children that are lazily loaded?",     
        "options": [
        {
       
          "value": "ListView",
          "color": "0xFFFFFFFF",
        },
        {
          
          "value": "GridView",
          "color": "0xFFFFFFFF",                              
        },
        {
          
          "value": "Scrollbar",
          "color": "0xFFFFFFFF",
        }
      ],
    },


    {
      "answer": "SizedBox",
      "is_answered": 0,
      "is_answer_status_right_wrong_notaswered": 0,
      "title": "Which component allows us to specify the distance between widgets on the screen?",
      "options": [
        {
          
          "value": "AppBar",
          "color": "0xFFFFFFFF",
        },
        {
          
          "value": "SizedBox",
          "color": "0xFFFFFFFF",
        },
        {
      
          "value": "Table",
          "color": "0xFFFFFFFF",
        },
      ],
    },
  ];

  final _pageController = PageController(initialPage: 0);
  int questionINdex = 0; // question number display 

  int wrong= 0;
  int totalRight = 0;

  quizResult(context) {
    
    wrong = 0;
    totalRight = 0;
    for (int i = 0; i < quizListData.length; i++) {
      if (quizListData[i]['is_answer_status_right_wrong_notanswered'] == 0) {
        wrong++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_notanswered'] == 1) {
        totalRight++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_notanswered'] == 2) {
        wrong++;
      }
    }

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) =>  QuizResultScreen(
            totalRight: totalRight,
            wrongQ: wrong,
          ),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 81, 14, 5),
      appBar: AppBar(
        title: const Text("Quiz.com"), 
        
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question :${questionINdex + 1}/${quizListData.length}",
              //string interpolation
              style: const TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,//page controller
                itemCount: quizListData.length,
                
                onPageChanged: (page) {
                  //statemanagemt
                  setState(
                    () {
                      questionINdex = page;
                    },
                  );
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration : BoxDecoration(
                          color: Color.fromARGB(255, 240, 117, 117),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            quizListData[index]['title'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ),
                      ...quizListData[index]['options']
                          .map(
                            (data) =>  SizedBox(
                                width: double.maxFinite,
                               
                                 child: TextButton(
                                    style: TextButton.styleFrom(
                                      
                                     backgroundColor: Color(
                                        int.parse(
                                          data['color'],
                                        ),
                                      ),
                                    ),
                                    //condition
                                    onPressed: () {
                                      if (quizListData[index]['is_answered'] ==
                                          0) {
                                        setState(() {
                                          if (data['value'] ==
                                              quizListData[index]['answer']) {
                                            data['color'] = "0xFF31CD63";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_notanswered'] = 1;
                                          } else {
                                            data['color'] = "0xFFFF0000";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_notanswered'] = 2;
                                          }
                                          quizListData[index]['is_answered'] =
                                              1;
                                        });
                                      } else {}
                                    },


                                   child: Text(      
                                            data['value'],
                                            style: const TextStyle(
                                              color: Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                  ),
                              ),
                          )
                          .toList(),
                    ],
                  );
                },
              ),
            )//expnaded
          ],
        ),
      ),


      floatingActionButton:
      
       FloatingActionButton.extended(
        onPressed: () {
          if (questionINdex == quizListData.length - 1) {
            quizResult(context);
           } 
           else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 5),
              curve: Curves.easeIn,
            );
          }
        },
        label:
            Text(
              questionINdex == quizListData.length - 1 ?
               "Submit" :
               " Next"),
      ),
    );
  }
}