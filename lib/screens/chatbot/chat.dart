// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sound_stream/sound_stream.dart';

// TODO import Dialogflow
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';

class Chat extends StatefulWidget {
  Chat({key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  bool _isRecording = false;
  bool _isClicked = false;

  RecorderStream _recorder = RecorderStream();
  late StreamSubscription _recorderStatus;
  late StreamSubscription<List<int>> _audioStreamSubscription;
  late BehaviorSubject<List<int>> _audioStream;

  // TODO DialogflowGrpc class instance

  late DialogflowGrpcV2Beta1 dialogflow;
  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  @override
  void dispose() {
    _recorderStatus.cancel();
    _audioStreamSubscription.cancel();

    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    _recorderStatus = _recorder.status.listen((status) {
      if (mounted)
        setState(() {
          _isRecording = status == SoundStreamStatus.Playing;
        });
    });

    await Future.wait([
      _recorder.initialize()
    ]);
    
    // TODO Get a Service account
    final serviceAccount = ServiceAccount.fromString(
        '${(await rootBundle.loadString('assets/credentials.json'))}');
    // Create a DialogflowGrpc Instance
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
  }

  void stopStream() async {
    await _recorder.stop();
    await _audioStreamSubscription.cancel();
    await _audioStream.close();
    // _isRecording = false;
  }

  void handleSubmitted(text) async {
    print(text);
    _textController.clear();

    //TODO Dialogflow Code
    ChatMessage message = ChatMessage(
      text: text,
      name: "You",
      type: true,
    );

    setState(() {
      if (text.length != 0) {
        _messages.insert(0, message);
      }
    });

    DetectIntentResponse data = await dialogflow.detectIntent(text, 'en-US');
    String fulfillmentText = data.queryResult.fulfillmentText;
    if(fulfillmentText.isNotEmpty) {
      ChatMessage botMessage = ChatMessage(
        text: fulfillmentText,
        name: "Bot",
        type: false,
      );

      setState(() {
        _messages.insert(0, botMessage);
      });
    }
  }

  void handleStream() async {
    _recorder.start();

    _audioStream = BehaviorSubject<List<int>>();
    _audioStreamSubscription = _recorder.audioStream.listen((data) {
      print(data);
      _audioStream.add(data);
    });

    // TODO Create SpeechContexts
    // Create an audio InputConfig
    var biasList = SpeechContextV2Beta1(
        phrases: [
          'Dialogflow CX',
          'Dialogflow Essentials',
          'Action Builder',
          'HIPAA'
        ],
        boost: 20.0
    );

    // See: https://cloud.google.com/dialogflow/es/docs/reference/rpc/google.cloud.dialogflow.v2#google.cloud.dialogflow.v2.InputAudioConfig
    var config = InputConfigV2beta1(
        encoding: 'AUDIO_ENCODING_LINEAR_16',
        languageCode: 'en-US',
        sampleRateHertz: 16000,
        singleUtterance: false,
        speechContexts: [biasList]
    );

    // TODO Make the streamingDetectIntent call, with the InputConfig and the audioStream
    final responseStream = dialogflow.streamingDetectIntent(config, _audioStream);
    // TODO Get the transcript and detectedIntent and show on screen
    // Get the transcript and detectedIntent and show on screen
    responseStream.listen((data) {
      //print('----');
      setState(() {
        //print(data);
        String transcript = data.recognitionResult.transcript;
        String queryText = data.queryResult.queryText;
        String fulfillmentText = data.queryResult.fulfillmentText;

        if(fulfillmentText.isNotEmpty) {

          ChatMessage message = new ChatMessage(
            text: queryText,
            name: "You",
            type: true,
          );

          ChatMessage botMessage = new ChatMessage(
            text: fulfillmentText,
            name: "Bot",
            type: false,
          );
          if (_isClicked) {
            _messages.insert(0, message);
            _textController.clear();
            _messages.insert(0, botMessage);
          }

        }
        if(transcript.isNotEmpty) {
          _textController.text = transcript;
        }
        _isClicked = false;
      });
    },onError: (e){
      //print(e);
    },onDone: () {
      //print('done');
    });
  }

  // The chat interface
  //
  //------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Flexible(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          )
      ),
      Divider(height: 1.0),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              color: Color(0xFFFAFAFA),
              boxShadow: [
                  BoxShadow(
                      color: Color(0xFFBDBDBD),
                      offset: const Offset(5.0, 5.0),
                      blurRadius: 10.0,
                      spreadRadius: 2.0
                  )
                ]
          ),
          child: IconTheme(
            data: IconThemeData(color: Color(0xFFFEBD40)),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 7.0),
              // margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  Container(
                    margin: EdgeInsets.fromLTRB(1.0, 3.0, 5.0, 3.0),
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xFFBDBDBD), width: 1.0)
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 40.0,
                        maxWidth: 249.0
                      ),
                      child: TextField(
                        controller: _textController,
                        onSubmitted: handleSubmitted,
                        decoration: InputDecoration.collapsed(hintText: "Send a message"),
                        showCursor: true,
                        // minLines: 1,
                        maxLines: null,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                          _isClicked = true;
                          handleSubmitted(_textController.text);
                        },
                    ),
                  ),
                  IconButton(
                    iconSize: 30.0,
                    icon: Icon(_isRecording ? Icons.mic : Icons.mic_off),
                    onPressed: _isRecording ? stopStream : handleStream,
                  ),
                ],
              ),
            ),
          )
      ),
    ]);
  }
}


//------------------------------------------------------------------------------------
// The chat message balloon
//
//------------------------------------------------------------------------------------
class ChatMessage extends StatelessWidget {
  ChatMessage({required this.text, required this.name, required this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context) {
    return <Widget> [
        Container(
          padding: const EdgeInsets.only(left: 20.0),
          child: const CircleAvatar(
              // backgroundColor: Color(0xFF),
              // child: new Text('B')
              child: const Icon(
                  Icons.tag_faces,
                  color: Colors.white,
              ),
              backgroundColor: Color(0xFFFF5252),
          ),
          margin: const EdgeInsets.only(right: 16.0),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  this.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0
                  )
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(text),
              ),
            ],
          ),
        ),
      ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              this.name,
              // style: Theme.of(context).textTheme.subtitle1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
            backgroundColor: Color(0xFFFF5252),
            // backgroundColor: Color(0xFFF6D6D7),
            child: Text(
              this.name[0],
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            )),
        padding: EdgeInsets.only(right: 20.0),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB((this.type ? MediaQuery.of(context).size.width*0.25 : 10.0), 15.0, (this.type ? 10.0 : MediaQuery.of(context).size.width*0.25), 10.0),
      child: Container(
        padding: EdgeInsets.fromLTRB((this.type? 45.0 : 0.0), 14.0, (this.type? 0.0 : 45.0), 14.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFBDBDBD),
                  offset: const Offset(3.0, 3.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0
              )
            ],
            color: !this.type ? Color(0xFFFFFFFF) : Color(0xFFFEBD40),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: this.type ? myMessage(context) : otherMessage(context),
        ),
      ),
    );
  }
}